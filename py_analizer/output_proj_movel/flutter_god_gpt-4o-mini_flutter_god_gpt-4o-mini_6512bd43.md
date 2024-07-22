To create a Flutter widget, we first need to define the purpose of the widget. For this example, let's create a simple widget that displays a list of electric vehicle charging stations using the EMEL Open Data API endpoint `GET /electricvehiclechargingstations/leve`.

### Step 1: Define the Widget Structure

We'll create a widget that fetches data from the API and displays it in a list format. The structure of our Flutter application will look like this:

```
lib/
├── api/
│   └── api_service.dart
├── models/
│   └── charging_station.dart
├── screens/
│   └── charging_stations_screen.dart
├── widgets/
│   └── charging_station_list.dart
└── main.dart
```

### Step 2: Create the Model

First, we need to create a model for the charging station.

**lib/models/charging_station.dart**
```dart
class ChargingStation {
  final String id;
  final String locationType;
  final String post;
  final String address;
  final List<double> coordinates;
  final String parish;
  final String postalCode;
  final String paymentMethod;
  final String contactService;

  ChargingStation({
    required this.id,
    required this.locationType,
    required this.post,
    required this.address,
    required this.coordinates,
    required this.parish,
    required this.postalCode,
    required this.paymentMethod,
    required this.contactService,
  });

  factory ChargingStation.fromJson(Map<String, dynamic> json) {
    return ChargingStation(
      id: json['carregadorId'],
      locationType: json['localizacaoTipo'],
      post: json['posto'],
      address: json['endereco'],
      coordinates: List<double>.from(json['coordenadas']),
      parish: json['freguesia'],
      postalCode: json['cP7'],
      paymentMethod: json['formaPagamento'],
      contactService: json['contactoSrvAssistencia'],
    );
  }
}
```

### Step 3: Create the API Service

Next, we will create a service to fetch data from the API.

**lib/api/api_service.dart**
```dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/charging_station.dart';

class ApiService {
  final String baseUrl = 'https://opendata.emel.pt/electricvehiclechargingstations/leve';

  Future<List<ChargingStation>> fetchChargingStations() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((station) => ChargingStation.fromJson(station)).toList();
    } else {
      throw Exception('Failed to load charging stations');
    }
  }
}
```

### Step 4: Create the Widget to Display the List

Now, we will create a widget that uses the API service to fetch and display the charging stations.

**lib/widgets/charging_station_list.dart**
```dart
import 'package:flutter/material.dart';
import '../api/api_service.dart';
import '../models/charging_station.dart';

class ChargingStationList extends StatefulWidget {
  @override
  _ChargingStationListState createState() => _ChargingStationListState();
}

class _ChargingStationListState extends State<ChargingStationList> {
  late Future<List<ChargingStation>> futureStations;

  @override
  void initState() {
    super.initState();
    futureStations = ApiService().fetchChargingStations();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChargingStation>>(
      future: futureStations,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No charging stations found.'));
        }

        final stations = snapshot.data!;
        return ListView.builder(
          itemCount: stations.length,
          itemBuilder: (context, index) {
            final station = stations[index];
            return ListTile(
              title: Text(station.post),
              subtitle: Text(station.address),
              trailing: Text(station.parish),
            );
          },
        );
      },
    );
  }
}
```

### Step 5: Create the Screen

Finally, we will create a screen to display our widget.

**lib/screens/charging_stations_screen.dart**
```dart
import 'package:flutter/material.dart';
import '../widgets/charging_station_list.dart';

class ChargingStationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Electric Vehicle Charging Stations'),
      ),
      body: ChargingStationList(),
    );
  }
}
```

### Step 6: Update `main.dart`

Lastly, we need to set up our main entry point.

**lib/main.dart**
```dart
import 'package:flutter/material.dart';
import 'screens/charging_stations_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EMEL Charging Stations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChargingStationsScreen(),
    );
  }
}
```

### Key Points and Optimizations

1. **Error Handling**: Ensure proper error handling in the API service and UI.
2. **Loading State**: Use a loading indicator while fetching data.
3. **Performance**: Consider pagination or lazy loading if the dataset is large.
4. **UI Enhancements**: You can enhance the UI with more details or maps for each station.

This implementation provides a basic structure for displaying electric vehicle charging stations in a Flutter app using the EMEL Open Data API. You can expand upon this by adding more features or improving the UI as needed.

---

