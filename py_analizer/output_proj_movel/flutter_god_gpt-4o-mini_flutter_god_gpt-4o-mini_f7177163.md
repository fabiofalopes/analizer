To implement a service in Dart that fetches data from the EMEL Open Data API, we will create a simple HTTP client that can make GET requests to the API endpoints. Below, I'll outline the steps and provide a code snippet for a service that fetches electric vehicle charging stations as an example.

### Step 1: Set Up Your Project Structure

First, ensure your Flutter project has the following structure:

```
lib/
├── api/
│   └── emel_service.dart
├── models/
├── screens/
├── widgets/
├── utils/
└── main.dart
```

### Step 2: Add Dependencies

Make sure to add the `http` package to your `pubspec.yaml` file to handle HTTP requests:

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.3
```

Run `flutter pub get` to install the new dependency.

### Step 3: Create the Service

In `lib/api/emel_service.dart`, create a service class that will handle fetching data from the API:

```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class EmelService {
  final String baseUrl = 'https://opendata.emel.pt';

  // Fetch electric vehicle charging stations
  Future<List<dynamic>> fetchElectricVehicleChargingStations() async {
    final response = await http.get(Uri.parse('$baseUrl/electricvehiclechargingstations/leve'));

    if (response.statusCode == 200) {
      // If the server returns an OK response, parse the JSON.
      return json.decode(response.body);
    } else {
      // If the response was not OK, throw an exception.
      throw Exception('Failed to load charging stations');
    }
  }
}
```

### Step 4: Using the Service

You can now use this service in your Flutter application. For example, you might call it from a screen or widget to display the list of charging stations.

Here’s a simple example of how you might use this service in a Flutter widget:

```dart
import 'package:flutter/material.dart';
import 'api/emel_service.dart';

class ChargingStationsScreen extends StatefulWidget {
  @override
  _ChargingStationsScreenState createState() => _ChargingStationsScreenState();
}

class _ChargingStationsScreenState extends State<ChargingStationsScreen> {
  late Future<List<dynamic>> chargingStations;

  @override
  void initState() {
    super.initState();
    EmelService emelService = EmelService();
    chargingStations = emelService.fetchElectricVehicleChargingStations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Charging Stations')),
      body: FutureBuilder<List<dynamic>>(
        future: chargingStations,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No charging stations found.'));
          }

          // Display the list of charging stations
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var station = snapshot.data![index];
              return ListTile(
                title: Text(station['posto']),
                subtitle: Text(station['endereco']),
              );
            },
          );
        },
      ),
    );
  }
}
```

### Key Points

1. **Error Handling**: The service includes basic error handling by throwing an exception if the request fails.
2. **FutureBuilder**: The `FutureBuilder` widget is used to handle asynchronous data fetching and display loading indicators or error messages as needed.
3. **JSON Parsing**: The response is parsed from JSON format into a Dart object for easy access.

This implementation provides a solid foundation for fetching data from the EMEL Open Data API and can be expanded to include other endpoints as needed.

---

