To create a function that parses GeoJSON data in a Flutter application, we will follow these steps:

1. **Identify the structure of the GeoJSON data**: GeoJSON typically contains a `type`, `features`, and each feature has its own `geometry` and `properties`.

2. **Create a model to represent the GeoJSON data**: This will help in deserializing the JSON into Dart objects.

3. **Implement the parsing function**: This function will take a JSON string, decode it, and convert it into our Dart model.

### Step 1: Define the GeoJSON Model

Let's create a model to represent the GeoJSON structure. We will create a `GeoJsonFeature` class and a `GeoJson` class.

```dart
// lib/models/geojson.dart

class GeoJson {
  final String type;
  final List<GeoJsonFeature> features;

  GeoJson({required this.type, required this.features});

  factory GeoJson.fromJson(Map<String, dynamic> json) {
    var featuresList = json['features'] as List;
    List<GeoJsonFeature> features = featuresList.map((i) => GeoJsonFeature.fromJson(i)).toList();

    return GeoJson(
      type: json['type'],
      features: features,
    );
  }
}

class GeoJsonFeature {
  final String type;
  final Geometry geometry;
  final Map<String, dynamic> properties;

  GeoJsonFeature({required this.type, required this.geometry, required this.properties});

  factory GeoJsonFeature.fromJson(Map<String, dynamic> json) {
    return GeoJsonFeature(
      type: json['type'],
      geometry: Geometry.fromJson(json['geometry']),
      properties: json['properties'],
    );
  }
}

class Geometry {
  final String type;
  final List<List<List<double>>> coordinates;

  Geometry({required this.type, required this.coordinates});

  factory Geometry.fromJson(Map<String, dynamic> json) {
    var coords = json['coordinates'] as List;
    return Geometry(
      type: json['type'],
      coordinates: List<List<List<double>>>.from(coords.map((c) => List<List<double>>.from(c.map((i) => List<double>.from(i))))),
    );
  }
}
```

### Step 2: Create the Parsing Function

Now we will create a function that takes a JSON string and returns a `GeoJson` object.

```dart
// lib/utils/geojson_parser.dart

import 'dart:convert';
import '../models/geojson.dart';

GeoJson parseGeoJson(String jsonString) {
  final Map<String, dynamic> jsonData = json.decode(jsonString);
  return GeoJson.fromJson(jsonData);
}
```

### Step 3: Usage Example

You can use the `parseGeoJson` function in your Flutter application like this:

```dart
// Example usage in a Flutter widget
import 'package:flutter/material.dart';
import '../utils/geojson_parser.dart';
import '../models/geojson.dart';

class GeoJsonExample extends StatelessWidget {
  final String geoJsonString = '''{
    "type": "FeatureCollection",
    "features": [
      {
        "type": "Feature",
        "geometry": {
          "type": "Point",
          "coordinates": [[-9.228515625, 38.685509760012]]
        },
        "properties": {
          "name": "Example Point"
        }
      }
    ]
  }''';

  @override
  Widget build(BuildContext context) {
    GeoJson geoJson = parseGeoJson(geoJsonString);

    return Scaffold(
      appBar: AppBar(title: Text('GeoJSON Example')),
      body: ListView.builder(
        itemCount: geoJson.features.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(geoJson.features[index].properties['name']),
            subtitle: Text(geoJson.features[index].geometry.type),
          );
        },
      ),
    );
  }
}
```

### Key Points

- **Modeling**: We created models to represent the structure of GeoJSON data, which makes it easier to work with.
- **Parsing**: The parsing function decodes the JSON string and converts it into Dart objects.
- **Usage**: The example shows how to use the parsing function within a Flutter widget.

This approach ensures that your code is clean, maintainable, and easy to understand. You can further optimize it by adding error handling for JSON parsing if needed.

---

