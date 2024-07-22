To implement a search function in a Flutter application that interacts with the EMEL Open Data API, we need to determine what specific data we want to search for. For this example, let's assume we want to search for electric vehicle charging stations based on their address or location.

### Steps to Implement the Search Function

1. **Identify the API Endpoint**: We will use the endpoint `GET /electricvehiclechargingstations/leve` to fetch the list of electric vehicle charging stations.

2. **Create a Search Bar**: We will create a search bar in the UI where users can input their search query.

3. **Fetch Data from API**: When the user submits their search query, we will call the API to fetch the relevant data.

4. **Display Results**: We will display the results in a list format.

### Code Implementation

Here’s how you can structure your Flutter application:

```
lib/
├── api/
│   └── api_service.dart
├── models/
│   └── charging_station.dart
├── screens/
│   └── search_screen.dart
├── widgets/
│   └── charging_station_list.dart
└── main.dart
```

#### 1. Create the Model

**models/charging_station.dart**
```dart
class ChargingStation {
  final String id;
  final String locationType;
  final String address;
  final List<double> coordinates;

  ChargingStation({required this.id, required this.locationType, required this.address, required this.coordinates});

  factory ChargingStation.fromJson(Map<String, dynamic> json) {
    return ChargingStation(
      id: json['carregadorId'],
      locationType: json['localizacaoTipo'],
      address: json['endereco'],
      coordinates: List<double>.from(json['coordenadas']),
    );
  }
}
```

#### 2. Create the API Service

**api/api_service.dart**
```dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/charging_station.dart';

class ApiService {
  final String baseUrl = 'https://opendata.emel.pt/electricvehiclechargingstations/leve';

  Future<List<ChargingStation>> fetchChargingStations() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((station) => ChargingStation.fromJson(station)).toList();
    } else {
      throw Exception('Failed to load charging stations');
    }
  }
}
```

#### 3. Create the Search Screen

**screens/search_screen.dart**
```dart
import 'package:flutter/material.dart';
import '../api/api_service.dart';
import '../models/charging_station.dart';
import '../widgets/charging_station_list.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<ChargingStation> _stations = [];
  bool _isLoading = false;

  void _searchStations() async {
    setState(() {
      _isLoading = true;
    });

    ApiService apiService = ApiService();
    List<ChargingStation> allStations = await apiService.fetchChargingStations();

    // Filter stations based on search query
    String query = _searchController.text.toLowerCase();
    _stations = allStations.where((station) => station.address.toLowerCase().contains(query)).toList();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Charging Stations')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search by Address',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchStations,
                ),
              ),
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : Expanded(child: ChargingStationList(stations: _stations)),
          ],
        ),
      ),
    );
  }
}
```

#### 4. Create the Charging Station List Widget

**widgets/charging_station_list.dart**
```dart
import 'package:flutter/material.dart';
import '../models/charging_station.dart';

class ChargingStationList extends StatelessWidget {
  final List<ChargingStation> stations;

  ChargingStationList({required this.stations});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: stations.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(stations[index].address),
          subtitle: Text('ID: ${stations[index].id}'),
        );
      },
    );
  }
}
```

#### 5. Update `main.dart`

**main.dart**
```dart
import 'package:flutter/material.dart';
import 'screens/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EMEL Charging Stations',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SearchScreen(),
    );
  }
}
```

### Key Points and Optimizations

- **Error Handling**: Ensure to handle errors gracefully when fetching data from the API.
- **Debouncing**: Consider implementing debouncing for the search input to avoid excessive API calls.
- **Pagination**: If the dataset is large, consider implementing pagination or lazy loading.
- **Caching**: Implement caching strategies to improve performance and reduce API calls.

This implementation provides a basic search functionality for electric vehicle charging stations using Flutter and the EMEL Open Data API. You can expand upon this by adding more features or refining the UI as needed.

---

