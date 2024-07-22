# TASK SUMMARY

- **Objective:** Debug and fix the integration of bicycle data (Gira stations) in the application.
- **Requirements:**
  - Identify and resolve errors preventing the fetching and displaying of bicycle data.
  - Ensure bicycle data is fetched from the API and saved into the local SQLite database.
  - Display Gira station locations on the map screen alongside car parking lots.

# SOLUTION

### main.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:projeto_emel/Consts/colors.dart';
import 'package:projeto_emel/Views/home_page.dart';
import 'package:projeto_emel/Views/welcome.dart';
import 'package:projeto_emel/Services/api_service.dart'; // Import the API service

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure widgets are initialized
  await dotenv.load(fileName: ".env"); // Load environment variables
  await populateDatabase(); // Populate the local database with API data
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EMEL Parking App',
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: lighterEmelNavBarColor,
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.green,
          background: Colors.white,
          tertiary: emelNavBarColor,
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/LoginRegisterScreen',
      routes: {
        '/LoginRegisterScreen': (context) => WelcomeScreen(),
        '/HomePage': (context) => HomePage(),
      },
    );
  }
}
```

### Services/api_service.dart
```dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/gira_station.dart';

class ApiService {
  static const String baseUrl = "https://api.example.com";

  static Future<List<GiraStation>> fetchGiraStations() async {
    final response = await http.get(Uri.parse('$baseUrl/cycling/gira/station/list'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => GiraStation.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Gira stations');
    }
  }

  static Future<GiraStation> fetchGiraStationById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/cycling/gira/station/$id'));

    if (response.statusCode == 200) {
      return GiraStation.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Gira station');
    }
  }
}
```

### models/gira_station.dart
```dart
class GiraStation {
  final String idExpl;
  final String estacaoLocalizacao;
  final double latitude;
  final double longitude;
  final int dispBicicleta;
  final String horarioFuncionamento;
  final String tarifario;
  final String formasPagto;
  final String contatoServAssistencia;
  final bool wifi;
  final String aberturaDt;
  final String criacaoDtt;
  final String atualizacaoDtt;
  final String cp7;
  final String servicosExtra;

  GiraStation({
    required this.idExpl,
    required this.estacaoLocalizacao,
    required this.latitude,
    required this.longitude,
    required this.dispBicicleta,
    required this.horarioFuncionamento,
    required this.tarifario,
    required this.formasPagto,
    required this.contatoServAssistencia,
    required this.wifi,
    required this.aberturaDt,
    required this.criacaoDtt,
    required this.atualizacaoDtt,
    required this.cp7,
    required this.servicosExtra,
  });

  factory GiraStation.fromJson(Map<String, dynamic> json) {
    return GiraStation(
      idExpl: json['id_expl'],
      estacaoLocalizacao: json['estacaolocalizacao'],
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      dispBicicleta: json['dispbicicleta'],
      horarioFuncionamento: json['horariofuncionamento'],
      tarifario: json['tarifario'],
      formasPagto: json['formaspagto'],
      contatoServAssistencia: json['contatoservassistencia'],
      wifi: json['wifi'],
      aberturaDt: json['aberturadt'],
      criacaoDtt: json['criacaodtt'],
      atualizacaoDtt: json['atualizacaodtt'],
      cp7: json['cp7'],
      servicosExtra: json['servicosextra'],
    );
  }
}
```

### Services/gira_station_manager.dart
```dart
import '../models/gira_station.dart';
import '../database_helper.dart';
import 'api_service.dart';

class GiraStationManager {
  Future<void> fetchAndSaveGiraStations() async {
    try {
      List<GiraStation> stations = await ApiService.fetchGiraStations();
      for (var station in stations) {
        await DatabaseHelper.instance.insertGiraStation(station);
      }
    } catch (e) {
      print('Error fetching and saving Gira stations: $e');
    }
  }

  Future<List<GiraStation>> fetchAllGiraStations() async {
    return await DatabaseHelper.instance.getAllGiraStations();
  }
}
```

### database_helper.dart
```dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/gira_station.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('app.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const giraStationTable = '''
      CREATE TABLE gira_stations (
        id_expl TEXT PRIMARY KEY,
        estacaolocalizacao TEXT,
        latitude REAL,
        longitude REAL,
        dispbicicleta INTEGER,
        horariofuncionamento TEXT,
        tarifario TEXT,
        formaspagto TEXT,
        contatoservassistencia TEXT,
        wifi INTEGER,
        aberturadt TEXT,
        criacaodtt TEXT,
        atualizacaodtt TEXT,
        cp7 TEXT,
        servicosextra TEXT
      )
    ''';

    await db.execute(giraStationTable);
  }

  Future<void> insertGiraStation(GiraStation station) async {
    final db = await instance.database;

    await db.insert(
      'gira_stations',
      station.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<GiraStation>> getAllGiraStations() async {
    final db = await instance.database;

    final result = await db.query('gira_stations');

    return result.map((json) => GiraStation.fromJson(json)).toList();
  }
}
```

### Views/find_parking_spot.dart
```dart
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../models/parking_lot.dart';
import '../models/gira_station.dart';
import '../Services/parking_lot_manager.dart';
import '../Services/gira_station_manager.dart';
import '../Consts/colors.dart';
import '../Views/parking_lot_details.dart';

class FindParkingSpot extends StatefulWidget {
  final bool showAppBar;

  const FindParkingSpot({Key? key, this.showAppBar = true}) : super(key: key);

  @override
  _FindParkingSpotState createState() => _FindParkingSpotState();
}

class _FindParkingSpotState extends State<FindParkingSpot> {
  final ParkingLotManager _parkingLotManager = ParkingLotManager();
  final GiraStationManager _giraStationManager = GiraStationManager();
  
  List<ParkingLot> _nearestParkingLots = [];
  List<GiraStation> _nearestGiraStations = [];
  
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchNearestLocations();
  }

  Future<void> _fetchNearestLocations() async {
    try {
      Position? position = await _getCurrentPosition();
      if (position == null) {
        throw Exception('Unable to get current location');
      }

      List<ParkingLot> lots = await _parkingLotManager.fetchAllParkingLots();
      List<GiraStation> stations = await _giraStationManager.fetchAllGiraStations();

      lots.sort((a, b) => _compareDistances(a.latitude, a.longitude, b.latitude, b.longitude, position));
      stations.sort((a, b) => _compareDistances(a.latitude, a.longitude, b.latitude, b.longitude, position));

      setState(() {
        _nearestParkingLots = lots.take(5).toList();
        _nearestGiraStations = stations.take(5).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  Future<Position?> _getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition();
  }

  int _compareDistances(double lat1, double lon1, double lat2, double lon2, Position userLocation) {
    double distanceA = Geolocator.distanceBetween(
      userLocation.latitude,
      userLocation.longitude,
      lat1,
      lon1,
    );
    
    double distanceB = Geolocator.distanceBetween(
      userLocation.latitude,
      userLocation.longitude,
      lat2,
      lon2,
    );
    
    return distanceA.compareTo(distanceB);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              title: Text('Find Parking Spot'),
              backgroundColor: emelNavBarColor,
            )
          : null,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (_errorMessage != null) {
      return Center(child: Text(_errorMessage!));
    } else {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Nearest Parking Spots',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 120, // Altura fixa para a linha de caixas
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _nearestParkingLots.length + _nearestGiraStations.length,
              itemBuilder: (context, index) => index < _nearestParkingLots.length 
                ? _buildParkingLotBox(_nearestParkingLots[index])
                : _buildGiraStationBox(_nearestGiraStations[index - _nearestParkingLots.length]),
            ),
          ),
          Expanded(
            child: Center(
              child: Text('Select a parking spot for more details'),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildParkingLotBox(ParkingLot parkingLot) {
    int freeSlots = parkingLot.capacidadeMax - parkingLot.ocupacao;
    
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ParkingLotDetailScreen(parkingLot: parkingLot),
        ),
      ),
      
      child: Container(
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.all(8),
        
        decoration: BoxDecoration(
          color: emelCardColor,
          borderRadius: BorderRadius.circular(8),
        ),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Text(
              parkingLot.nome,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            
            SizedBox(height: 4),
            
            Text(
              '$freeSlots free',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
    
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  




    
  
  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  



  





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    





    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                
                                                                                                                

```

# EXPLANATION

- **main.dart:** Ensured that the `populateDatabase` function is called to populate the local database with API data.
- **Services/api_service.dart:** Added methods to fetch Gira station data from the API.
- **models/gira_station.dart:** Created a model class for Gira stations.
- **Services/gira_station_manager.dart:** Added methods to fetch and save Gira station data.
- **database_helper.dart:** Added methods to handle database operations for Gira stations.
- **Views/find_parking_spot.dart:** Updated to fetch and display both parking lots and Gira stations.

# OPTIMIZATIONS

- Ensured that both parking lots and Gira stations are fetched and displayed efficiently.
- Used sorting to display the nearest locations first.

# TROUBLESHOOTING

- **Issue:** Error fetching latest data; displaying cached data.
- **Solution:** Added error handling and connectivity checks to ensure that cached data is displayed when there is no internet connection.

# DEPENDENCIES

- `http`: For making API calls.
- `sqflite`: For local database operations.
- `ge

---

