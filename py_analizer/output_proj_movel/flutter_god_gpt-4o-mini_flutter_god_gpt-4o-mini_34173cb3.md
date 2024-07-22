To implement error handling in a Flutter application that interacts with the EMEL Open Data API, you can follow these steps:

1. **Identify Potential Errors**: Understand the types of errors that can occur during API calls, such as network issues, invalid responses, or server errors.

2. **Use Try-Catch Blocks**: Wrap your API calls in try-catch blocks to handle exceptions gracefully.

3. **Check Response Status**: After making an API call, check the response status code to determine if the request was successful.

4. **Display Error Messages**: Provide user-friendly error messages based on the type of error encountered.

Here’s an example implementation that demonstrates how to handle errors when fetching data from the EMEL Open Data API for electric vehicle charging stations:

### Directory Structure
```
lib/
├── api/
│   └── emel_api.dart
├── models/
│   └── charging_station.dart
├── screens/
│   └── charging_stations_screen.dart
├── widgets/
│   └── error_widget.dart
└── main.dart
```

### 1. Create the API Service (`emel_api.dart`)
```dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/charging_station.dart';

class EmelApi {
  final String baseUrl = 'https://opendata.emel.pt/electricvehiclechargingstations/leve';

  Future<List<ChargingStation>> fetchChargingStations() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((station) => ChargingStation.fromJson(station)).toList();
      } else {
        throw Exception('Failed to load charging stations: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
```

### 2. Create the Model (`charging_station.dart`)
```dart
class ChargingStation {
  final String carregadorId;
  final String localizacaoTipo;
  final String posto;
  final String endereco;

  ChargingStation({
    required this.carregadorId,
    required this.localizacaoTipo,
    required this.posto,
    required this.endereco,
  });

  factory ChargingStation.fromJson(Map<String, dynamic> json) {
    return ChargingStation(
      carregadorId: json['carregadorId'],
      localizacaoTipo: json['localizacaoTipo'],
      posto: json['posto'],
      endereco: json['endereco'],
    );
  }
}
```

### 3. Create the Screen (`charging_stations_screen.dart`)
```dart
import 'package:flutter/material.dart';
import '../api/emel_api.dart';
import '../models/charging_station.dart';
import '../widgets/error_widget.dart';

class ChargingStationsScreen extends StatefulWidget {
  @override
  _ChargingStationsScreenState createState() => _ChargingStationsScreenState();
}

class _ChargingStationsScreenState extends State<ChargingStationsScreen> {
  late Future<List<ChargingStation>> futureStations;

  @override
  void initState() {
    super.initState();
    futureStations = EmelApi().fetchChargingStations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Charging Stations')),
      body: FutureBuilder<List<ChargingStation>>(
        future: futureStations,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return CustomErrorWidget(errorMessage: snapshot.error.toString());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No charging stations found.'));
          }

          List<ChargingStation> stations = snapshot.data!;
          return ListView.builder(
            itemCount: stations.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(stations[index].posto),
                subtitle: Text(stations[index].endereco),
              );
            },
          );
        },
      ),
    );
  }
}
```

### 4. Create a Custom Error Widget (`error_widget.dart`)
```dart
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;

  const CustomErrorWidget({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: Colors.red, size: 48),
          SizedBox(height: 16),
          Text(
            'An error occurred:',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
```

### Key Points:
- **Error Handling**: The `try-catch` block in the API service captures any exceptions during the HTTP request.
- **Response Validation**: The status code is checked to ensure the request was successful.
- **User Feedback**: The `FutureBuilder` provides a loading indicator while fetching data and displays an error message if something goes wrong.
- **Custom Error Widget**: A reusable widget is created to display error messages in a user-friendly manner.

This structure allows for clean separation of concerns and makes it easy to manage errors effectively in your Flutter application.

---

