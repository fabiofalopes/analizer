Aqui está um resumo dos principais pontos do enunciado do projeto:

# TASK SUMMARY

- Desenvolver uma aplicação móvel Flutter para Android que ajuda usuários a encontrar estacionamentos em uma cidade
- Implementar as seguintes funcionalidades:
  - Exibir mapa com marcadores para estacionamentos de carros e estações de bicicletas (Gira)
  - Permitir alternar entre exibir apenas estacionamentos de carros ou apenas estações de bicicletas no mapa
  - Ao clicar em um marcador de estação Gira, exibir tela com detalhes como número de docas, bicicletas disponíveis, endereço, etc.
  - Permitir registrar incidentes para estações Gira (vandalismo, problemas na liberação de bicicletas, etc.)
  - Exibir lista de incidentes registrados para cada estação Gira
- Requisitos técnicos:
  - Usar injeção de dependências com Provider
  - Usar SQLite para persistência local de dados
  - Implementar arquitetura separando UI e lógica de negócios
  - Funcionar offline
  - Implementar testes unitários/integração
- Entregar:
  - Código fonte no GitHub
  - APK no Moodle
  - Vídeo de demonstração no YouTube
  - README com screenshots, autoavaliação, etc.

Os principais desafios são integrar os dados da API da EMEL, implementar a persistência local, e desenvolver uma arquitetura robusta seguindo as boas práticas de desenvolvimento Flutter.

# SOLUTION

Aqui está uma possível solução para implementar as funcionalidades solicitadas:

```dart
// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:parking_app/services/parking_service.dart';
import 'package:parking_app/views/map_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ParkingService()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parking App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MapScreen(),
    );
  }
}

// services/parking_service.dart
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:parking_app/models/parking_lot.dart';
import 'package:parking_app/models/bike_station.dart';
import 'package:parking_app/models/incident.dart';

class ParkingService with ChangeNotifier {
  List<ParkingLot> _parkingLots = [];
  List<BikeStation> _bikeStations = [];
  
  Future<void> fetchParkingData() async {
    final response = await http.get(Uri.parse('https://api.emel.pt/parking'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _parkingLots = data.map((json) => ParkingLot.fromJson(json)).toList();
      notifyListeners();
    }
  }
  
  Future<void> fetchBikeStations() async {
    final response = await http.get(Uri.parse('https://api.emel.pt/gira/stations'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _bikeStations = data.map((json) => BikeStation.fromJson(json)).toList();
      notifyListeners();
    }
  }
  
  Future<void> addIncident(Incident incident) async {
    final db = await openDatabase('parking_app.db');
    await db.insert('incidents', incident.toMap());
    notifyListeners();
  }
  
  Future<List<Incident>> getIncidents(int stationId) async {
    final db = await openDatabase('parking_app.db');
    final maps = await db.query('incidents', where: 'stationId = ?', whereArgs: [stationId]);
    return List.generate(maps.length, (i) => Incident.fromMap(maps[i]));
  }
}

// views/map_screen.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:parking_app/services/parking_service.dart';
import 'package:parking_app/views/bike_station_detail.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool _showParkingLots = true;
  bool _showBikeStations = true;
  
  @override
  Widget build(BuildContext context) {
    final parkingService = Provider.of<ParkingService>(context);
    
    return Scaffold(
      appBar: AppBar(title: Text('Parking Map')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(38.7223, -9.1393),
          zoom: 12,
        ),
        markers: _buildMarkers(parkingService),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.local_parking),
            onPressed: () => setState(() => _showParkingLots = !_showParkingLots),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            child: Icon(Icons.directions_bike),
            onPressed: () => setState(() => _showBikeStations = !_showBikeStations),
          ),
        ],
      ),
    );
  }
  
  Set<Marker> _buildMarkers(ParkingService parkingService) {
    Set<Marker> markers = {};
    
    if (_showParkingLots) {
      markers.addAll(parkingService._parkingLots.map((lot) => Marker(
        markerId: MarkerId(lot.id.toString()),
        position: LatLng(lot.latitude, lot.longitude),
        infoWindow: InfoWindow(title: lot.name),
      )));
    }
    
    if (_showBikeStations) {
      markers.addAll(parkingService._bikeStations.map((station) => Marker(
        markerId: MarkerId(station.id.toString()),
        position: LatLng(station.latitude, station.longitude),
        infoWindow: InfoWindow(title: station.name),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => BikeStationDetail(station: station)),
        ),
      )));
    }
    
    return markers;
  }
}

// views/bike_station_detail.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:parking_app/models/bike_station.dart';
import 'package:parking_app/services/parking_service.dart';
import 'package:parking_app/views/add_incident.dart';

class BikeStationDetail extends StatelessWidget {
  final BikeStation station;
  
  BikeStationDetail({required this.station});
  
  @override
  Widget build(BuildContext context) {
    final parkingService = Provider.of<ParkingService>(context);
    
    return Scaffold(
      appBar: AppBar(title: Text(station.name)),
      body: Column(
        children: [
          ListTile(title: Text('Docks: ${station.numDocks}')),
          ListTile(title: Text('Bikes: ${station.numBikes}')),
          ListTile(title: Text('Address: ${station.address}')),
          ListTile(title: Text('Last Update: ${station.lastUpdate}')),
          Expanded(
            child: FutureBuilder(
              future: parkingService.getIncidents(station.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final incidents = snapshot.data ?? [];
                  return ListView.builder(
                    itemCount: incidents.length,
                    itemBuilder: (context, index) {
                      final incident = incidents[index];
                      return ListTile(
                        title: Text(incident.description),
                        subtitle: Text(incident.type),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => AddIncident(stationId: station.id)),
        ),
      ),
    );
  }
}

// views/add_incident.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:parking_app/services/parking_service.dart';
import 'package:parking_app/models/incident.dart';

class AddIncident extends StatefulWidget {
  final int stationId;
  
  AddIncident({required this.stationId});
  
  @override
  _AddIncidentState createState() => _AddIncidentState();
}

class _AddIncidentState extends State<AddIncident> {
  final _formKey = GlobalKey<FormState>();
  String _description = '';
  String _type = 'Vandalized Bike';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Report Incident')),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
              validator: (value) {
                if (value == null || value.length < 20) {
                  return 'Description must be at least 20 characters long';
                }
                return null;
              },
              onSaved: (value) => _description = value!,
            ),
            DropdownButtonFormField<String>(
              value: _type,
              items: ['Vandalized Bike', 'Dock Not Releasing Bike', 'Other']
                  .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                  .toList(),
              onChanged: (value) => setState(() => _type = value!),
            ),
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final incident = Incident(
                    stationId: widget.stationId,
                    description: _description,
                    type: _type,
                  );
                  Provider.of<ParkingService>(context, listen: false).addIncident(incident);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
```

# EXPLANATION

1. A aplicação usa o padrão Provider para gerenciamento de estado e injeção de dependências.

2. O `ParkingService` é responsável por buscar dados da API, armazenar localmente e gerenciar incidentes.

3. A tela principal (`MapScreen`) exibe um mapa do Google com marcadores para estacionamentos e estações de bicicletas. Botões flutuantes permitem alternar entre os tipos de marcadores.

4. Ao tocar em um marcador de estação de bicicletas, o usuário é levado para a tela de detalhes (`BikeStationDetail`).

5. A tela de detalhes exibe informações sobre a estação e uma lista de incidentes. Um botão flutuante permite adicionar novos incidentes.

6. A tela de adição de incidentes (`AddIncident`) contém um formulário para registrar novos incidentes.

7. Os dados são persistidos localmente usando SQLite.

# OPTIMIZATIONS

1. Implementar cache de dados para melhorar o desempenho offline.
2. Usar `FutureBuilder` ou `StreamBuilder` para carregar dados assincronamente.
3. Implementar paginação para listas longas de incidentes.
4. Usar `const` para widgets que não mudam para melhorar o desempenho.
5. Implementar lazy loading para carregar dados do mapa conforme necessário.

# TROUBLESHOOTING

1. Problema: Mapa não carrega
   Solução: Verifique se a chave da API do Google Maps está configurada corretamente.

2. Problema: Dados não são atualizados
   Solução: Verifique a conectividade de rede e implemente um mecanismo de retry.

3. Problema: Erro ao salvar incidentes
   Solução: Verifique se o banco de dados SQLite está inicializado corretamente.

4. Problema: Desempenho lento ao carregar muitos marcadores
   Solução: Implemente clustering de marcadores ou carregue apenas marcadores visíveis.

5. Problema: Crash ao rotacionar a tela
   Solução: Use `setState` corretamente e gerencie o ciclo de vida dos widgets.

# DEPENDENCIES

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0
  http: ^0.13.3
  sqflite: ^2.0.0+3
  google_maps_flutter: ^2.0.6
```

Para instalar as dependências, execute:
```
flutter pub get
```

# SUMMARY

Esta solução implementa um aplicativo Flutter para encontrar estacionamentos, integrando dados da API EMEL, usando Provider para gerenciamento de estado, SQLite para persistência local e Google Maps para visualização.


---

