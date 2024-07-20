### main.dart/main
---
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:projeto_emel/Consts/colors.dart';
//import 'package:projeto_emel/Views/dashboard.dart';
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
        //'/ParkingDashboard': (context) => ParkingDashboard(),
      },
    );
  }
}
---
### Consts/colors
---
import 'dart:ui';

Color emelNavBarColor = const Color(0xFF004F6D);
Color lighterEmelNavBarColor = const Color(0xFF006A89);
Color emelCardColor = const Color(0xFF1295BD);---
### Views/find_parking_spot
---
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../models/parking_lot.dart';
import '../Services/parking_lot_manager.dart';
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
  List<ParkingLot> _nearestParkingLots = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchNearestParkingLots();
  }

  Future<void> _fetchNearestParkingLots() async {
    try {
      Position? position = await _getCurrentPosition();
      if (position == null) {
        throw Exception('Unable to get current location');
      }

      List<ParkingLot> lots = await _parkingLotManager.fetchAllParkingLots();
      lots.sort((a, b) => _compareDistances(a, b, position));

      setState(() {
        _nearestParkingLots = lots.take(5).toList();
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

  int _compareDistances(ParkingLot a, ParkingLot b, Position userLocation) {
    double distanceA = Geolocator.distanceBetween(
      userLocation.latitude,
      userLocation.longitude,
      double.parse(a.latitude),
      double.parse(a.longitude),
    );
    double distanceB = Geolocator.distanceBetween(
      userLocation.latitude,
      userLocation.longitude,
      double.parse(b.latitude),
      double.parse(b.longitude),
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
              itemCount: _nearestParkingLots.length,
              itemBuilder: (context, index) =>
                  _buildParkingLotBox(_nearestParkingLots[index]),
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
    );
  }
}
---
### Views/parking_lot_table_view
---
import 'package:flutter/material.dart';
import '../models/parking_lot.dart';
import '../database_helper.dart';

class ParkingLotTableView extends StatefulWidget {
  @override
  _ParkingLotTableViewState createState() => _ParkingLotTableViewState();
}

class _ParkingLotTableViewState extends State<ParkingLotTableView> {
  Future<List<ParkingLot>>? _parkingLots;
  List<ParkingLot> _allParkingLots = [];
  List<ParkingLot> _displayedParkingLots = [];
  bool _isAscending = true;
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _parkingLots = _fetchParkingLots();
  }

  Future<List<ParkingLot>> _fetchParkingLots() async {
    List<ParkingLot> parkingLots = await ParkingLot.fetchAll();
    setState(() {
      _allParkingLots = parkingLots;
      _displayedParkingLots = parkingLots;
    });
    return parkingLots;
  }

  void _sortColumn(String column) {
    setState(() {
      if (_isAscending) {
        _displayedParkingLots.sort((a, b) => a.toMap()[column]?.compareTo(b.toMap()[column]));
      } else {
        _displayedParkingLots.sort((a, b) => b.toMap()[column]?.compareTo(a.toMap()[column]));
      }
      _isAscending = !_isAscending;
    });
  }

  void _filterParkingLots(String query) {
    final lowerQuery = query.toLowerCase();
    setState(() {
      _displayedParkingLots = _allParkingLots.where((parkingLot) {
        return parkingLot.idParque.toLowerCase().contains(lowerQuery) ||
               parkingLot.nome.toLowerCase().contains(lowerQuery) ||
               parkingLot.latitude.toLowerCase().contains(lowerQuery) ||
               parkingLot.longitude.toLowerCase().contains(lowerQuery) ||
               parkingLot.tipo.toLowerCase().contains(lowerQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parking Lot Table View'),
      ),
      body: FutureBuilder<List<ParkingLot>>(
        future: _parkingLots,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (query) {
                      _searchQuery = query;
                      _filterParkingLots(query);
                    },
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        sortAscending: _isAscending,
                        columns: [
                          DataColumn(
                            label: Text('ID Parque'),
                            onSort: (columnIndex, _) {
                              _sortColumn('idParque');
                            },
                          ),
                          DataColumn(
                            label: Text('Name'),
                            onSort: (columnIndex, _) {
                              _sortColumn('nome');
                            },
                          ),
                          DataColumn(
                            label: Text('Active'),
                            onSort: (columnIndex, _) {
                              _sortColumn('activo');
                            },
                          ),
                          DataColumn(
                            label: Text('Entity ID'),
                            onSort: (columnIndex, _) {
                              _sortColumn('idEntidade');
                            },
                          ),
                          DataColumn(
                            label: Text('Capacity'),
                            onSort: (columnIndex, _) {
                              _sortColumn('capacidadeMax');
                            },
                          ),
                          DataColumn(
                            label: Text('Occupation'),
                            onSort: (columnIndex, _) {
                              _sortColumn('ocupacao');
                            },
                          ),
                          DataColumn(
                            label: Text('Last Update'),
                            onSort: (columnIndex, _) {
                              _sortColumn('dataOcupacao');
                            },
                          ),
                          DataColumn(
                            label: Text('Latitude'),
                            onSort: (columnIndex, _) {
                              _sortColumn('latitude');
                            },
                          ),
                          DataColumn(
                            label: Text('Longitude'),
                            onSort: (columnIndex, _) {
                              _sortColumn('longitude');
                            },
                          ),
                          DataColumn(
                            label: Text('Type'),
                            onSort: (columnIndex, _) {
                              _sortColumn('tipo');
                            },
                          ),
                          DataColumn(
                            label: Text('Free Slots'),
                            onSort: (columnIndex, _) {
                              _sortColumn('freeSlots');
                            },
                          ),
                        ],
                        rows: _displayedParkingLots.map((parkingLot) {
                          return DataRow(
                            cells: [
                              DataCell(Text(parkingLot.idParque)),
                              DataCell(Text(parkingLot.nome)),
                              DataCell(Text(parkingLot.activo.toString())),
                              DataCell(Text(parkingLot.idEntidade.toString())),
                              DataCell(Text(parkingLot.capacidadeMax.toString())),
                              DataCell(Text(parkingLot.ocupacao.toString())),
                              DataCell(Text(parkingLot.dataOcupacao)),
                              DataCell(Text(parkingLot.latitude)),
                              DataCell(Text(parkingLot.longitude)),
                              DataCell(Text(parkingLot.tipo)),
                              DataCell(Text(parkingLot.freeSlots.toString())),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          List<ParkingLot> lots = await _fetchParkingLots();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Data refreshed, ${lots.length} parking lots loaded.')),
          );
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}---
### Views/table_view
---
import 'package:flutter/material.dart';
import '../models/incident.dart';
import '../database_helper.dart';

class TableView extends StatefulWidget {
  @override
  _TableViewState createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  Future<List<Incident>>? _incidents;
  List<Incident> _allIncidents = [];
  List<Incident> _displayedIncidents = [];
  bool _isAscending = true;
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _incidents = _fetchIncidents();
  }

  Future<List<Incident>> _fetchIncidents() async {
    List<Incident> incidents = await Incident.fetchAll();
    setState(() {
      _allIncidents = incidents;
      _displayedIncidents = incidents;
    });
    return incidents;
  }

  void _sortColumn(String column) {
    setState(() {
      if (_isAscending) {
        _displayedIncidents.sort((a, b) => a.toMap()[column]?.compareTo(b.toMap()[column]));
      } else {
        _displayedIncidents.sort((a, b) => b.toMap()[column]?.compareTo(a.toMap()[column]));
      }
      _isAscending = !_isAscending;
    });
  }

  void _filterIncidents(String query) {
    final lowerQuery = query.toLowerCase();
    setState(() {
      _displayedIncidents = _allIncidents.where((incident) {
        return incident.parkId.toLowerCase().contains(lowerQuery) ||
               incident.description.toLowerCase().contains(lowerQuery) ||
               incident.timestamp.toLowerCase().contains(lowerQuery) ||
               incident.imagePath.toLowerCase().contains(lowerQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Incident Table View'),
      ),
      body: FutureBuilder<List<Incident>>(
        future: _incidents,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (query) {
                      _searchQuery = query;
                      _filterIncidents(query);
                    },
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        sortAscending: _isAscending,
                        columns: [
                          DataColumn(
                            label: Text('Park ID'),
                            onSort: (columnIndex, _) {
                              _sortColumn('parkId');
                            },
                          ),
                          DataColumn(
                            label: Text('Description'),
                            onSort: (columnIndex, _) {
                              _sortColumn('description');
                            },
                          ),
                          DataColumn(
                            label: Text('Severity'),
                            onSort: (columnIndex, _) {
                              _sortColumn('severity');
                            },
                          ),
                          DataColumn(
                            label: Text('Timestamp'),
                            onSort: (columnIndex, _) {
                              _sortColumn('timestamp');
                            },
                          ),
                          DataColumn(
                            label: Text('Image Path'),
                            onSort: (columnIndex, _) {
                              _sortColumn('imagePath');
                            },
                          ),
                        ],
                        rows: _displayedIncidents.map((incident) {
                          return DataRow(
                            cells: [
                              DataCell(Text(incident.parkId)),
                              DataCell(Text(incident.description)),
                              DataCell(Text(incident.severity.toString())),
                              DataCell(Text(incident.timestamp)),
                              DataCell(Text(incident.imagePath)),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          List<Incident> incidents = await _fetchIncidents();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Data refreshed, ${incidents.length} incidents loaded.')),
          );
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}---
### Views/register
---
import 'package:flutter/material.dart';
import 'package:projeto_emel/Views/home_page.dart';
import '../Services/user_manager.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userManager = UserManager();
  String _username = 'teste';
  String _email = 'teste';
  String _password = 'teste';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Color(0xFF004F6D),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Create Account', style: TextStyle(color: Colors.white)),

      ),
      body: Container(
    padding: const EdgeInsets.only(left: 36.0, right: 36.0),
    alignment: Alignment.center,
    decoration: const BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF004F6D) ,Color(0xFF006A89), Color(0xEEEEEEFF)],
    ),
    ),

    child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  initialValue: _username, // teste
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person, color: Colors.white),
                  ),
                  onSaved: (value) {
                    _username = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  initialValue: _email, //teste
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email, color: Colors.white),
                  ),
                  onSaved: (value) {
                    _email = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  initialValue: _password, //teste
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                  ),
                  obscureText: true,
                  onSaved: (value) {
                    _password = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _userManager.register(_username, _password,"temp",false);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}---
### Views/parking_lot_details
---
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../models/parking_lot.dart';
import '../Services/incidents_manager.dart';
import '../models/incident.dart';
import '../Services/parking_lot_manager.dart';

class ParkingLotDetailScreen extends StatefulWidget {
  final ParkingLot parkingLot;

  const ParkingLotDetailScreen({Key? key, required this.parkingLot})
      : super(key: key);

  @override
  _ParkingLotDetailScreenState createState() => _ParkingLotDetailScreenState();
}

class _ParkingLotDetailScreenState extends State<ParkingLotDetailScreen> {
  late Future<List<Incident>> _incidentsFuture;
  late Future<ParkingLot> _parkingLotFuture;
  ValueNotifier<bool> _hasError = ValueNotifier<bool>(false);
  ParkingLotManager parkingLotManager = ParkingLotManager();

  @override
  void initState() {
    super.initState();
    _initData();
    Connectivity().onConnectivityChanged.listen((results) {
      if (results == ConnectivityResult.none) {
        // No internet connection
        if (mounted) {
          _hasError.value = true;
        }
      } else {
        // Internet connection restored
        _fetchData();
      }
    });
  }

  void _initData() {
    _parkingLotFuture = parkingLotManager.fetchOneParkingLot(widget.parkingLot.idParque);
    _incidentsFuture = IncidentsManager.getIncidentsForParkFromDB(widget.parkingLot.idParque);
  }

  Future<void> _fetchData() async {
    try {
      ParkingLot updatedParkingLot = await parkingLotManager.fetchOneParkingLot(widget.parkingLot.idParque);
      if (mounted) {
        setState(() {
          _parkingLotFuture = Future.value(updatedParkingLot);
          _hasError.value = false;
        });
      }
    } catch (e) {
      print('Error fetching parking lot from API: $e');
      if (mounted) {
        _hasError.value = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.parkingLot.nome),
      ),
      body: ValueListenableBuilder<bool>(
        valueListenable: _hasError,
        builder: (context, hasError, child) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildParkingLotDetails(),
                    SizedBox(height: 15),
                    _buildIncidentsList(),
                    SizedBox(height: 15),
                    _buildMap(),
                  ],
                ),
              ),
              if (hasError)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.yellow[200],
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.warning, color: Colors.yellow[900]),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Error fetching latest data; displaying cached data.',
                            style: TextStyle(color: Colors.yellow[900]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildParkingLotDetails() {
    double occupancyPercentage = widget.parkingLot.ocupacao / widget.parkingLot.capacidadeMax;
    bool isFull = occupancyPercentage >= 1.0;
    occupancyPercentage = occupancyPercentage.clamp(0.0, 1.0);

    bool showPercentage = !(widget.parkingLot.ocupacao < 0 || widget.parkingLot.ocupacao > widget.parkingLot.capacidadeMax);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Parking Lot Name: ${widget.parkingLot.nome}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text('Category: ${widget.parkingLot.tipo}'),
        SizedBox(height: 10),
        Text((widget.parkingLot.ocupacao < 0 || widget.parkingLot.ocupacao > widget.parkingLot.capacidadeMax) ? 'Current Occupancy: Information is not available at the moment' : 'Current Occupancy: ${widget.parkingLot.ocupacao}'),
        if (showPercentage) ...[
          SizedBox(height: 10),
          Text('Capacity: ${widget.parkingLot.capacidadeMax}'),
          SizedBox(height: 10),
          Text('Free slots: ${widget.parkingLot.capacidadeMax- widget.parkingLot.ocupacao}'),
          SizedBox(height: 5),
          Text('Occupancy Percentage: ${(occupancyPercentage * 100).toStringAsFixed(2)}%'),
          SizedBox(height: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
            child: Container(
              height: 20, // Adjust the height as needed
              width: double.infinity,
              child: LinearProgressIndicator(
                value: occupancyPercentage,
                color: isFull ? Colors.red : null,
                backgroundColor: Colors.grey[300],
              ),
            ),
          ),
          SizedBox(height: 15),
        ],
        Text('Last updated: ${widget.parkingLot.dataOcupacao}'),
        SizedBox(height: 10),
        Text('Incidents', style: TextStyle(fontSize: 30)),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildIncidentsList() {
    return Expanded(
      child: FutureBuilder<List<Incident>>(
        future: _incidentsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || _hasError.value) {
            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return Center(child: Text("Error and no cached data available: ${snapshot.error}"));
            } else {
              return _buildList(snapshot.data!, error: true);
            }
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No incidents found.'));
          } else {
            return _buildList(snapshot.data!);
          }
        },
      ),
    );
  }

  Widget _buildMap() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(
                  double.parse(widget.parkingLot.latitude),
                  double.parse(widget.parkingLot.longitude),
                ),
                zoom: 18
            ),
            markers: {
              Marker(
                markerId: MarkerId(widget.parkingLot.idParque),
                position: LatLng(
                  double.parse(widget.parkingLot.latitude),
                  double.parse(widget.parkingLot.longitude),
                ),
              ),
            },
            zoomControlsEnabled: false,
            rotateGesturesEnabled: false,
            tiltGesturesEnabled: false,
            scrollGesturesEnabled: false,
            zoomGesturesEnabled: false,
          ),
        ),
      ),
    );
  }

  Widget _buildList(List<Incident> incidents, {bool error = false}) {
    return Padding(
      padding: EdgeInsets.only(top: error ? 40.0 : 0),
      child: Container(
        decoration: error
            ? BoxDecoration(
          border: Border.all(color: Colors.yellow, width: 2.0),
        )
            : null,
        child: ListView.builder(
          itemCount: incidents.length,
          itemBuilder: (context, index) {
            Incident incident = incidents[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: InkWell(
                onTap: () {
                  _showIncidentInfo(context, incident);
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${incident.description}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        _formatTimestamp(incident.timestamp),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String _formatTimestamp(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);
    String formattedTimestamp = '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
    return formattedTimestamp;
  }

  void _showIncidentInfo(BuildContext context, Incident incident) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Incident Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Description: ${incident.description}'),
              Text('Severity: ${incident.severity}'),
              if (incident.imagePath != null && incident.imagePath.isNotEmpty)
                Image.file(File(incident.imagePath)),
              Text('Timestamp: ${_formatTimestamp(incident.timestamp)}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
---
### Views/park_list
---
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../models/parking_lot.dart';
import '../Services/parking_lot_manager.dart';
import '../Views/parking_lot_details.dart';

class ParkList extends StatefulWidget {
  const ParkList({super.key});

  @override
  State<ParkList> createState() => _ParkListState();
}

class _ParkListState extends State<ParkList> {
  Future<List<ParkingLot>>? _parkingLotsFuture;
  bool _hasError = false;
  List<ParkingLot>? _localData;
  ParkingLotManager _parkingLotManager = ParkingLotManager();

  @override
  void initState() {
    super.initState();
    _fetchData();
    Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        setState(() {
          _hasError = true;
        });
      } else {
        _fetchData();
      }
    });
  }

  Future<void> _fetchData() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult != ConnectivityResult.none) {
        List<ParkingLot> apiData = await _parkingLotManager.fetchAllParkingLots();
        if (mounted) {
          setState(() {
            _localData = apiData;
            _parkingLotsFuture = Future.value(apiData);
            _hasError = false;
          });
        }
      } else {
        List<ParkingLot> localData = await _parkingLotManager.fetchAllParkingLotsFromDB();
        if (mounted) {
          setState(() {
            _localData = localData;
            _parkingLotsFuture = Future.value(localData);
            _hasError = true;
          });
        }
      }
    } catch (error) {
      if (mounted) {
        List<ParkingLot> localData = await _parkingLotManager.fetchAllParkingLotsFromDB();
        setState(() {
          _localData = localData;
          _parkingLotsFuture = Future.value(localData);
          _hasError = true;
        });
      }
    }
  }

  Future<void> _refreshParkingLots() async {
    await _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<List<ParkingLot>>(
          future: _parkingLotsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError || _hasError) {
              if (_localData == null || _localData!.isEmpty) {
                return Center(child: Text("Error and no cached data available: ${snapshot.error}"));
              } else {
                return _buildList(_localData!, error: true);
              }
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return _buildList(snapshot.data!);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        if (_hasError)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.yellow[200],
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.warning, color: Colors.yellow[900]),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Error fetching latest data; displaying cached data.',
                      style: TextStyle(color: Colors.yellow[900]),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildList(List<ParkingLot> parkingLots, {bool error = false}) {
    return Padding(
      padding: EdgeInsets.only(top: error ? 40.0 : 0),
      child: Container(
        decoration: error
            ? BoxDecoration(
          border: Border.all(color: Colors.yellow, width: 2.0),
        )
            : null,
        child: RefreshIndicator(
          onRefresh: _refreshParkingLots,
          child: ListView.builder(
            itemCount: parkingLots.length,
            itemBuilder: (context, index) {
              var park = parkingLots[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ParkingLotDetailScreen(parkingLot: park),
                    ),
                  );
                },
                child: Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Nome do Parque: ${park.nome}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(park.ocupacao < 0 ? 'Ocupação: Information is not available at the moment' : 'Ocupação: ${park.ocupacao}/${park.capacidadeMax}'),
                        const SizedBox(height: 4),
                        Text('Ultima atualização: ${park.dataOcupacao}'),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
---
### Views/traffic_closures_view
---
// lib/Views/traffic_closures_view.dart

import 'package:flutter/material.dart';
import '../Services/api_service.dart';

class TrafficClosuresView extends StatefulWidget {
  final bool showAppBar;

  TrafficClosuresView(
      {this.showAppBar = true}); // Constructor to pass showAppBar

  @override
  _TrafficClosuresViewState createState() => _TrafficClosuresViewState();
}

class _TrafficClosuresViewState extends State<TrafficClosuresView> {
  late Future<List<dynamic>> _trafficClosures;

  @override
  void initState() {
    super.initState();
    _trafficClosures = getTrafficClosures();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              title: Text('Traffic Closures'),
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: _trafficClosures,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text("No traffic closures found"));
                  } else {
                    return _buildClosuresList(snapshot.data!);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClosuresList(List<dynamic> closures) {
    return ListView.builder(
      itemCount: closures.length,
      itemBuilder: (context, index) {
        var closure = closures[index];
        var properties =
            (closure is Map<String, dynamic>) ? closure['properties'] : null;
        properties = (properties is Map<String, dynamic>) ? properties : {};

        var periodos = properties['periodos_condicionamentos'];
        periodos = (periodos is Map<String, dynamic>) ? periodos : {};

        return Card(
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
            leading: Icon(Icons.block, color: Colors.red),
            title: Text(properties['morada'] ?? 'No Address'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Restriction: ${properties['restricao_circulacao'] ?? 'N/A'}'),
                Text('Reason: ${properties['motivo'] ?? 'N/A'}'),
                Text('Impact: ${properties['impacto'] ?? 'N/A'}'),
                Text(
                    'From: ${periodos['date_min'] ?? ''} ${periodos['hour_min'] ?? ''} '
                    'to ${periodos['date_max'] ?? ''} ${periodos['hour_max'] ?? ''}'),
              ],
            ),
            trailing: Text(properties['estado'] ?? 'N/A',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          ),
        );
      },
    );
  }
}
---
### Views/map
---
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../models/parking_lot.dart';
import '../models/gira_station.dart'; 
import '../Services/parking_lot_manager.dart';
import '../Services/gira_station_manager.dart'; 
import '../Views/parking_lot_details.dart';
import '../Views/gira_station_details.dart'; 

class MapsScreen extends StatefulWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late GoogleMapController mapController;
  Position? currentPosition;
  List<ParkingLot> parkingLots = [];
  List<GiraStation> giraStations = [];
  bool _isPositionObtained = false;
  ValueNotifier<bool> _hasError = ValueNotifier<bool>(false);
  bool _isLoading = true;
  ParkingLotManager parkingLotManager = ParkingLotManager();
  GiraStationManager giraStationManager = GiraStationManager();
  bool showEMELMarkers = true;

  @override
  void initState() {
    super.initState();
    _init();
    Connectivity().onConnectivityChanged.listen((result) {
      if (result != ConnectivityResult.none) {
        // Internet connection restored
        _fetchData();
      }
    });
  }

  Future<void> _init() async {
    await _requestLocationPermission();
    await _getCurrentPosition();
    await _fetchData();
  }

  Future<void> _fetchData() async {
    await _fetchParkingLots();
    await _fetchGiraStations();
  }

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      status = await Permission.location.request();
      if (!status.isGranted) {
        await _showLocationPermissionDialog();
      }
    }
  }

  Future<void> _showLocationPermissionDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Location Permission'),
          content: Text(
              'This app needs location permission to function properly. Please grant it in the app settings.'),
          actions: <Widget>[
            TextButton(
              child: Text('Open Settings'),
              onPressed: () {
                openAppSettings();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _getCurrentPosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      if (mounted) {
        setState(() {
          currentPosition = position;
          _isPositionObtained = true;
        });
      }
    } catch (e) {
      print('Error getting current position: $e');
    }
  }

  Future<void> _fetchParkingLots() async {
    try {
      // Check for internet connectivity
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        // Fetch from local database if no internet connection
        List<ParkingLot> dbData = await parkingLotManager.fetchAllParkingLotsFromDB();
        setState(() {
          parkingLots = dbData;
          _hasError.value = true;
        });
      } else {
        // Fetch from API if internet connection is available
        List<ParkingLot> apiData = await parkingLotManager.fetchAllParkingLots();
        setState(() {
          parkingLots = apiData;
          _hasError.value = false;
        });
      }
    } catch (e) {
      print('Error fetching parking lots: $e');
      _hasError.value = true;
    }
  }

  Future<void> _fetchGiraStations() async {
    try {
      // Check for internet connectivity
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        // Fetch from local database if no internet connection
        List<GiraStation> dbData = await giraStationManager.fetchAllGiraStationsFromDB();
        setState(() {
          giraStations = dbData;
          _hasError.value = true;
        });
      } else {
        // Fetch from API if internet connection is available
        List<GiraStation> apiData = await giraStationManager.fetchAllGiraStations();
        setState(() {
          giraStations = apiData;
          _hasError.value = false;
        });
      }
    } catch (e) {
      print('Error fetching GIRA stations: $e');
      _hasError.value = true;
    }
  }

  Set<Marker> _buildParkingLotMarkers() {
    return parkingLots.map((parkingLot) {
      double latitude = double.tryParse(parkingLot.latitude) ?? 0.0;
      double longitude = double.tryParse(parkingLot.longitude) ?? 0.0;
      return Marker(
        markerId: MarkerId(parkingLot.idParque),
        position: LatLng(latitude, longitude),
        onTap: () {
          _showParkingLotDetails(context, parkingLot);
        },
      );
    }).toSet();
  }

  Set<Marker> _buildGiraStationMarkers() {
    return giraStations.map((station) {
      double latitude = double.tryParse(station.latitude) ?? 0.0;
      double longitude = double.tryParse(station.longitude) ?? 0.0;
      return Marker(
        markerId: MarkerId(station.idStation),
        position: LatLng(latitude, longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue), // Cor diferenciadora para GIRA
        onTap: () {
          _showGiraStationDetails(context, station);
        },
      );
    }).toSet();
  }

  void _showParkingLotDetails(BuildContext context, ParkingLot parkingLot) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ParkingLotDetailScreen(parkingLot: parkingLot),
      ),
    );
  }

  void _showGiraStationDetails(BuildContext context, GiraStation station) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GiraStationDetailScreen(station: station),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.directions_car),
            onPressed: () {
              setState(() {
                showEMELMarkers = true;
              });
            },
            tooltip: "Show EMEL Parkings",
          ),
          IconButton(
            icon: Icon(Icons.pedal_bike),
            onPressed: () {
              setState(() {
                showEMELMarkers = false;
              });
            },
            tooltip: "Show GIRA Stations",
          ),
        ],
      ),
      body: Stack(
        children: [
          if (_isPositionObtained && currentPosition != null)
            ValueListenableBuilder<bool>(
              valueListenable: _hasError,
              builder: (context, hasError, child) {
                return Stack(
                  children: [
                    GoogleMap(
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(currentPosition!.latitude, currentPosition!.longitude),
                        zoom: 14,
                      ),
                      myLocationEnabled: true,
                      markers: showEMELMarkers ? _buildParkingLotMarkers() : _buildGiraStationMarkers(), // Alterna entre EMEL e GIRA
                    ),
                    if (hasError)
                      Container(
                        color: Colors.yellow[200],
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.warning, color: Colors.yellow[900]),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Error fetching latest data; displaying cached data.',
                                style: TextStyle(color: Colors.yellow[900]),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                );
              },
            )
          else
            Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      _isLoading = false;
    });
  }
}---
### Views/login
---
import 'package:flutter/material.dart';
import 'package:projeto_emel/Views/home_page.dart';
import '../Services/user_manager.dart';

class LoginRegisterScreen extends StatefulWidget {
  @override
  _LoginRegisterScreenState createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userManager = UserManager();
  String _email = 'teste';
  String _password = 'teste';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Color(0xFF004F6D),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Login', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 36.0, right: 36.0),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF004F6D), Color(0xFF006A89), Color(0xEEEEEEFF)],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    initialValue: _email, // teste
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email, color: Colors.white),
                    ),
                    onSaved: (value) {
                      _email = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    initialValue: _password, // teste
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                    ),
                    obscureText: true,
                    onSaved: (value) {
                      _password = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        bool loginSuccess = await _userManager.login(_email, _password);
                        if (loginSuccess) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('User does not exist or password is incorrect')),
                          );
                        }
                      }
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
---
### Views/report
---
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_emel/Views/home_page.dart';
import '../models/incident.dart';
import '../models/parking_lot.dart';
import '../models/gira_station.dart'; 
import '../Services/incidents_manager.dart';
import '../Services/parking_lot_manager.dart';
import '../Services/gira_station_manager.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ParkingLot? selectedParkingLot;
  GiraStation? selectedGiraStation; 
  List<ParkingLot> parkingLots = [];
  List<GiraStation> giraStations = []; 
  double severity = 0;
  String description = '';
  XFile? image;
  bool _hasError = false;
  String incidentType = 'EMEL'; 
  String giraIncidentType = 'Bicicleta vandalizada'; 

  late ParkingLotManager _parkingLotManager;
  late GiraStationManager _giraStationManager; 

  @override
  void initState() {
    super.initState();
    _parkingLotManager = ParkingLotManager();
    _giraStationManager = GiraStationManager();
    _loadParkingLots();
    _loadGiraStations();
  }

  Future<void> _loadParkingLots() async {
    try {
      print('Fetching parking lots...');
      List<ParkingLot> fetchedParkingLots = await _parkingLotManager.fetchAllParkingLots();
      setState(() {
        parkingLots = fetchedParkingLots;
        selectedParkingLot = fetchedParkingLots.isNotEmpty ? fetchedParkingLots[0] : null;
      });
    } catch (error) {
      print('Error fetching parking lots: $error');
      setState(() {
        _hasError = true;
      });
      try {
        print('Fetching parking lots from local database...');
        List<ParkingLot> localParkingLots = await _parkingLotManager.fetchAllParkingLotsFromDB();
        setState(() {
          parkingLots = localParkingLots;
          selectedParkingLot = localParkingLots.isNotEmpty ? localParkingLots[0] : null;
        });
      } catch (error) {
        print('Error fetching parking lots from local database: $error');
        setState(() {
          _hasError = true;
        });
      }
    }
  }

  Future<void> _loadGiraStations() async {
    try {
      print('Fetching GIRA stations...');
      List<GiraStation> fetchedGiraStations = await _giraStationManager.fetchAllGiraStations();
      setState(() {
        giraStations = fetchedGiraStations;
        selectedGiraStation = fetchedGiraStations.isNotEmpty ? fetchedGiraStations[0] : null;
      });
    } catch (error) {
      print('Error fetching GIRA stations: $error');
      setState(() {
        _hasError = true;
      });
      try {
        print('Fetching GIRA stations from local database...');
        List<GiraStation> localGiraStations = await _giraStationManager.fetchAllGiraStationsFromDB();
        setState(() {
          giraStations = localGiraStations;
          selectedGiraStation = localGiraStations.isNotEmpty ? localGiraStations[0] : null;
        });
      } catch (error) {
        print('Error fetching GIRA stations from local database: $error');
        setState(() {
          _hasError = true;
        });
      }
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? selectedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = selectedImage;
    });
  }

  bool _validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _submitForm() {
    if (_validateAndSave()) {
      if (description.isNotEmpty) {
        String timestamp = DateTime.now().toString();
        final imagePath = image?.path ?? '';
        final newIncident = Incident(
          parkId: incidentType == 'EMEL' ? selectedParkingLot!.idParque : selectedGiraStation!.idStation,
          description: description,
          severity: severity,
          timestamp: timestamp,
          imagePath: imagePath,
          incidentType: incidentType,
          giraIncidentType: giraIncidentType,
        );

        IncidentsManager.addIncident(newIncident);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Incident reported successfully!')),
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Description cannot be empty')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all the fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_hasError) ...[
                Container(
                  color: Colors.yellow[200],
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.warning, color: Colors.yellow[900]),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Error fetching latest data; displaying cached data.',
                          style: TextStyle(color: Colors.yellow[900]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              Text(
                'Report',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DropdownButtonFormField<String>(
                      value: incidentType,
                      onChanged: (newValue) {
                        setState(() {
                          incidentType = newValue!;
                        });
                      },
                      items: ['EMEL', 'GIRA'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: 'Incident Type',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      ),
                    ),
                    SizedBox(height: 20),
                    if (incidentType == 'EMEL' && parkingLots.isNotEmpty) ...[
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: DropdownButtonFormField<ParkingLot>(
                          decoration: InputDecoration(
                            labelText: 'Select Parking Lot',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          ),
                          value: selectedParkingLot,
                          onChanged: (newValue) {
                            setState(() {
                              selectedParkingLot = newValue!;
                            });
                          },
                          validator: (value) => value == null ? 'Please select a parking lot' : null,
                          items: parkingLots.map<DropdownMenuItem<ParkingLot>>((ParkingLot value) {
                            return DropdownMenuItem<ParkingLot>(
                              value: value,
                              child: Text(value.nome),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                    if (incidentType == 'GIRA' && giraStations.isNotEmpty) ...[
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: DropdownButtonFormField<GiraStation>(
                          decoration: InputDecoration(
                            labelText: 'Select GIRA Station',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          ),
                          value: selectedGiraStation,
                          onChanged: (newValue) {
                            setState(() {
                              selectedGiraStation = newValue!;
                            });
                          },
                          validator: (value) => value == null ? 'Please select a GIRA station' : null,
                          items: giraStations.map<DropdownMenuItem<GiraStation>>((GiraStation value) {
                            return DropdownMenuItem<GiraStation>(
                              value: value,
                              child: Text(value.desigComercial),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        value: giraIncidentType,
                        onChanged: (newValue) {
                          setState(() {
                            giraIncidentType = newValue!;
                          });
                        },
                        items: [
                          'Bicicleta vandalizada',
                          'Doca não libertou bicicleta',
                          'Outra situação',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          labelText: 'GIRA Incident Type',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        ),
                      ),
                    ],
                    SizedBox(height: 20),
                    TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        description = value!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Severity (0-10)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        severity = double.parse(value!);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a severity value';
                        }
                        final double? severityValue = double.tryParse(value);

                        if (severityValue == null || severityValue < 0 || severityValue > 10) {
                          return 'Please enter a value between 0 and 10';
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    OutlinedButton.icon(
                      icon: Icon(Icons.camera_alt),
                      label: Text('Pick an image'),
                      onPressed: _pickImage,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}---
### Views/admin
---
import 'package:flutter/material.dart';
import '../Services/user_manager.dart';
import '../Views/find_parking_spot.dart';
import '../Views/table_view.dart';
import '../Views/user_table_view.dart';
import '../Views/parking_lot_table_view.dart';
//import 'traffic_view.bk';
import '../models/user.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final UserManager _userManager = UserManager();
  User? get currentUser => _userManager.currentUser;

  @override
  Widget build(BuildContext context) {

    // Get screen width
    double screenWidth = MediaQuery.of(context).size.width;
    
    // Calculate font size based on screen width
    double fontSize = screenWidth * 0.03; // Adjust this value

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          // ...
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('Find Parking', FindParkingSpot(), fontSize),
                _buildButton('View Incidents Table', TableView(),fontSize),
            ],  
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton('View Users Table', UserTableView(),fontSize),
            _buildButton('View Parking Lots Table', ParkingLotTableView(),fontSize),
          ],
        )
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, Widget destination, double fontSize) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize), // Use dynamic font size
      ),
    );
  }
}---
### Views/dashboard
---
import 'package:flutter/material.dart';
import 'package:projeto_emel/Views/find_parking_spot.dart';
import 'package:projeto_emel/Views/table_view.dart';
import 'package:projeto_emel/Views/traffic_closures_view.dart';
import 'package:projeto_emel/Views/traffic_jams_view.dart';
import 'package:projeto_emel/Views/user_table_view.dart';
import 'package:projeto_emel/Views/parking_lot_table_view.dart';
//import 'package:projeto_emel/Views/traffic_view.bk';
import 'package:projeto_emel/Services/user_manager.dart';
import 'package:projeto_emel/models/user.dart';

class ParkingDashboard extends StatefulWidget {
  @override
  _ParkingDashboardState createState() => _ParkingDashboardState();
}

class _ParkingDashboardState extends State<ParkingDashboard> {
  final UserManager _userManager = UserManager();
  User? get currentUser => _userManager.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: GridView.count(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                children: [
                  _buildDashboardItem(context, 'Find Parking',
                      FindParkingSpot(), FindParkingSpot(showAppBar: false)),
                  //###_buildDashboardItem(context, 'Traffic Information', TrafficView(), TrafficView(showAppBar: false)),
                  _buildDashboardItem(
                      context,
                      'Traffic Closures',
                      TrafficClosuresView(),
                      TrafficClosuresView(showAppBar: false)),
                  _buildDashboardItem(context, 'Traffic Jams',
                      TrafficJamsView(), TrafficJamsView(showAppBar: false)),
                  //_buildDashboardItem(context, 'Incidents Table', TableView(), TableView(showAppBar: false)),
                  //_buildDashboardItem(context, 'Users Table', UserTableView(), UserTableView(showAppBar: false)),
                  //_buildDashboardItem(context, 'Parking Lots Table', ParkingLotTableView(), ParkingLotTableView(showAppBar: false)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://www.emel.pt/fotos/press/logo_youtubeasset_9_5822391386530fbd8a1264.png'),
            radius: 30.0,
          ),
          SizedBox(width: 20.0),
          Text(
            'Welcome, ${currentUser?.name}!',
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardItem(
      BuildContext context, String title, Widget view, Widget preview) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => view),
        );
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(8),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Expanded(
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: preview, // Display view preview here
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
---
### Views/gira_station_details
---
import 'package:flutter/material.dart';
import '../models/gira_station.dart';
import '../Services/incidents_manager.dart';
import '../models/incident.dart';

class GiraStationDetailScreen extends StatelessWidget {
  final GiraStation station;

  const GiraStationDetailScreen({Key? key, required this.station}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(station.desigComercial),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Estação GIRA: ${station.desigComercial}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Número de docas: ${station.numDocas}'),
            SizedBox(height: 10),
            Text('Número de bicicletas: ${station.numBicicletas}'),
            SizedBox(height: 10),
            Text('Última atualização: ${station.updateDate}'),
            SizedBox(height: 20),
            Text(
              'Incidentes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<Incident>>(
                future: IncidentsManager.getIncidentsForPark(station.idStation),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('Nenhum incidente registado.'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var incident = snapshot.data![index];
                        return ListTile(
                          title: Text(incident.description),
                          subtitle: Text('Gravidade: ${incident.severity}, Data: ${incident.timestamp}'),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}---
### Views/traffic_jams_view
---
// lib/Views/traffic_jams_view.dart

import 'package:flutter/material.dart';
import '../Services/api_service.dart';

class TrafficJamsView extends StatefulWidget {
  final bool showAppBar;

  TrafficJamsView({this.showAppBar = true}); // Constructor to pass showAppBar

  @override
  _TrafficJamsViewState createState() => _TrafficJamsViewState();
}

class _TrafficJamsViewState extends State<TrafficJamsView> {
  late Future<List<dynamic>> _wazeTrafficJams;

  @override
  void initState() {
    super.initState();
    _wazeTrafficJams = getWazeTrafficJams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar ? AppBar(
        title: Text('Traffic Jams'),
      ) : null,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: _wazeTrafficJams,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text("No traffic jams found"));
                  } else {
                    return _buildJamsList(snapshot.data!);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJamsList(List<dynamic> jams) {
    return ListView.builder(
      itemCount: jams.length,
      itemBuilder: (context, index) {
        var jam = jams[index];
        var properties = (jam is Map<String, dynamic>) ? jam['properties'] : null;
        properties = (properties is Map<String, dynamic>) ? properties : {};

        return Card(
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
            leading: Icon(Icons.traffic, color: Colors.orange),
            title: Text('City: ${properties['city'] ?? 'No City'}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Street: ${properties['street'] ?? 'N/A'}'),
                Text('Level: ${properties['level']?.toString() ?? 'N/A'}'),
                Text('Speed: ${properties['speed']?.toString() ?? 'N/A'} km/h'),
                Text('Length: ${properties['length']?.toString() ?? 'N/A'} meters'),
              ],
            ),
          ),
        );
      },
    );
  }
}
---
### Views/home_page
---
import 'package:flutter/material.dart';
import 'package:projeto_emel/Views/map.dart';
import 'package:projeto_emel/Views/park_list.dart';
import 'package:projeto_emel/Views/welcome.dart';
import '../Components/navigation_bar.dart';
import 'package:projeto_emel/Views/report.dart';
import 'package:projeto_emel/Views/dashboard.dart';
import 'package:projeto_emel/Services/user_manager.dart';

import 'admin.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  UserManager _userManager = UserManager();

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      ParkingDashboard(),
      ParkList(),
      MapsScreen(),
      ReportPage(),
      if (_userManager.currentUser?.isAdmin ?? false) AdminDashboard(), // Add this
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('EMEL Parking App'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _userManager.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => WelcomeScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: NewNavigationBar(
        currentIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        isAdmin: _userManager.currentUser?.isAdmin ?? false, // Use the isAdmin property of the User object
      ),
    );
  }
}
---
### Views/user_table_view
---
import 'package:flutter/material.dart';
import '../Services/user_manager.dart';
import '../models/user.dart';
import '../database_helper.dart';

class UserTableView extends StatefulWidget {
  @override
  _UserTableViewState createState() => _UserTableViewState();
}

class _UserTableViewState extends State<UserTableView> {
  Future<List<User>>? _users;
  List<User> _allUsers = [];
  List<User> _displayedUsers = [];
  bool _isAscending = true;
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _users = _fetchUsers();
  }

  Future<List<User>> _fetchUsers() async {
    List<User> users = await User.fetchAll();
    setState(() {
      _allUsers = users;
      _displayedUsers = users;
    });
    return users;
  }

  void _sortColumn(String column) {
    setState(() {
      if (_isAscending) {
        _displayedUsers.sort((a, b) => a.toMap()[column]?.compareTo(b.toMap()[column]));
      } else {
        _displayedUsers.sort((a, b) => b.toMap()[column]?.compareTo(a.toMap()[column]));
      }
      _isAscending = !_isAscending;
    });
  }

  void _filterUsers(String query) {
    final lowerQuery = query.toLowerCase();
    setState(() {
      _displayedUsers = _allUsers.where((user) {
        return user.name.toLowerCase().contains(lowerQuery) ||
               user.licensePlate.toLowerCase().contains(lowerQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Table View'),
      ),
      body: FutureBuilder<List<User>>(
        future: _users,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (query) {
                      _searchQuery = query;
                      _filterUsers(query);
                    },
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        sortAscending: _isAscending,
                        columns: [
                          DataColumn(
                            label: Text('Name'),
                            onSort: (columnIndex, _) {
                              _sortColumn('name');
                            },
                          ),
                          DataColumn(
                            label: Text('License Plate'),
                            onSort: (columnIndex, _) {
                              _sortColumn('licensePlate');
                            },
                          ),
                          DataColumn(
                            label: Text('IsAdmin'),
                            onSort: (columnIndex, _) {
                              _sortColumn('isAdmin');
                            },
                          ),
                          DataColumn(
                            label: Text('Add Admin'),
                          ),
                          DataColumn(
                            label: Text('Remove Admin'),
                          ),
                        ],
                        rows: _displayedUsers.map((user) {
                          return DataRow(
                            cells: [
                              DataCell(Text(user.name)),
                              DataCell(Text(user.licensePlate)),
                              DataCell(Text(user.isAdmin ? 'Yes' : 'No')),
                              DataCell(
                                IconButton(
                                  icon: Icon(Icons.add_circle_outline),
                                  onPressed: () {
                                    // Call a method to add admin privileges
                                    UserManager().makeAdmin(user);
                                  },
                                ),
                              ),
                              DataCell(
                                IconButton(
                                  icon: Icon(Icons.remove_circle_outline),
                                  onPressed: () {
                                    // Call a method to remove admin privileges
                                    UserManager().removeAdmin(user);
                                  },
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          List<User> users = await _fetchUsers();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Data refreshed, ${users.length} users loaded.')),
          );
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}---
### Views/welcome
---
import 'package:flutter/material.dart';
import 'package:projeto_emel/Views/login.dart';
import 'package:projeto_emel/Views/register.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(left: 36.0, right: 36.0),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF004F6D) ,Color(0xFF006A89), Color(0xEEEEEEFF)],
            ),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  'Assets/Images/logo_emel.png',
                  width: 100, // specify the width of the image
                  height: 100, // specify the height of the image
                  fit: BoxFit.cover, // use this to inscribe the image into the box
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Welcome to our EMEL Parking app!',
                    style: TextStyle(color:Colors.white, fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontFamily: 'Roboto'),
                    textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    child: Text('Login'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginRegisterScreen()),
                      );
                    },
                  ),
                  ElevatedButton(
                    child: Text('Create Account'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterScreen()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}
---
### database_helper.dart/database_helper
---
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'parking_app.db');
    return await openDatabase(
      path,
      version: 2, // Incrementar a versão do banco de dados para aplicar as mudanças
      onCreate: _onCreate,
      onUpgrade: _onUpgrade
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        password TEXT,
        licensePlate TEXT,
        isAdmin INTEGER
      )
    ''');

    await db.execute('''
      INSERT INTO users (name, password, licensePlate, isAdmin)
      VALUES ('admin', 'admin', 'ADMIN123', 1)
    ''');

    await db.execute('''
      CREATE TABLE incidents (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        parkId TEXT,
        description TEXT,
        severity REAL,
        timestamp TEXT,
        imagePath TEXT,
        incidentType TEXT,
        giraIncidentType TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE parking_lots (
        idParque TEXT PRIMARY KEY,
        nome TEXT,
        activo INTEGER,
        idEntidade INTEGER,
        capacidadeMax INTEGER,
        ocupacao INTEGER,
        dataOcupacao TEXT,
        latitude TEXT,
        longitude TEXT,
        tipo TEXT,
        freeSlots INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE gira_stations (
        idStation TEXT PRIMARY KEY,
        numDocas INTEGER,
        numBicicletas INTEGER,
        desigComercial TEXT,
        updateDate TEXT,
        latitude TEXT,
        longitude TEXT
      )
    ''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        CREATE TABLE gira_stations (
          idStation TEXT PRIMARY KEY,
          numDocas INTEGER,
          numBicicletas INTEGER,
          desigComercial TEXT,
          updateDate TEXT,
          latitude TEXT,
          longitude TEXT
        )
      ''');
      
      await db.execute('''
        ALTER TABLE incidents ADD COLUMN incidentType TEXT;
        ALTER TABLE incidents ADD COLUMN giraIncidentType TEXT;
      ''');
    }
  }
}---
### Services/user_manager
---
import 'package:flutter/cupertino.dart';
import '../models/user.dart';

class UserManager extends ChangeNotifier {
  static final UserManager _singleton = UserManager._internal();

  factory UserManager() {
    return _singleton;
  }

  UserManager._internal();

  User? _currentUser;
  List<User> _users = [];

  User? get currentUser => _currentUser;

  set currentUser(User? user) {
    _currentUser = user;
    notifyListeners();
  }

  Future<void> register(String name, String password, String licensePlate, bool isAdmin) async { // Add isAdmin parameter
    User newUser = User(name: name, password: password, licensePlate: licensePlate, isAdmin: isAdmin); // Pass isAdmin to User constructor
    _currentUser = newUser;
    _users.add(newUser);
    await newUser.save();
  }

  Future<bool> login(String name, String password) async {
    List<User> allUsers = await User.fetchAll();
    for (User user in allUsers) {
      if (user.name == name && user.password == password) {
        _currentUser = user;
        return true;
      }
    }
    return false;
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }

  Future<void> removeAdmin(User user) async {
    user.isAdmin = false;
    await user.save();
    notifyListeners();
  }


  Future<void> makeAdmin(User user) async {
    user.isAdmin = true;
    await user.save();
    notifyListeners();
  }

}---
### Services/api_service
---
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/parking_lot.dart';
import 'package:projeto_emel/models/parking_lot.dart';
import '../models/gira_station.dart'; // Novo import

Future<void> main() async {
  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Populate the database
  await populateDatabase();
}

Future<List<ParkingLot>> getParkingLots() async {
  final response = await http.get(
    Uri.parse('https://emel.city-platform.com/opendata/parking/lots'),
    headers: {
      'api_key': dotenv.env['API_KEY']!,
    },
  );

  if (response.statusCode == 200) {
    List<dynamic> json = jsonDecode(response.body);
    List<ParkingLot> parkingLots = json.map((item) => ParkingLot.fromJson(item)).toList();

    // Save to database
    for (var parkingLot in parkingLots) {
      await parkingLot.save();
    }

    return parkingLots;
  } else {
    throw Exception('Failed to load parking lots');
  }
}

Future<List<dynamic>> getTrafficClosures() async {
  final response = await http.get(
    Uri.parse('https://emel.city-platform.com/opendata/traffic/closures/list'),
    headers: {
      'api_key': dotenv.env['API_KEY']!,
    },
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(response.body);
    return json['features'] as List<dynamic>;
  } else {
    throw Exception('Failed to load traffic closures');
  }
}

Future<List<dynamic>> getWazeTrafficJams() async {
  final response = await http.get(
    Uri.parse('https://emel.city-platform.com/opendata/traffic/waze/jams/list'),
    headers: {
      'api_key': dotenv.env['API_KEY']!,
    },
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(response.body);
    return json['features'] as List<dynamic>;
  } else {
    throw Exception('Failed to load waze traffic jams');
  }
}

Future<List<GiraStation>> getGiraStations() async {
  final response = await http.get(
    Uri.parse('https://emel.city-platform.com/opendata/gira/station/list'),
    headers: {
      'api_key': dotenv.env['API_KEY']!,
    },
  );

  if (response.statusCode == 200) {
    List<dynamic> json = jsonDecode(response.body);
    List<GiraStation> giraStations = json.map((item) => GiraStation.fromJson(item)).toList();

    // Save to database
    for (var giraStation in giraStations) {
      await giraStation.save();
    }

    return giraStations;
  } else {
    throw Exception('Failed to load GIRA stations');
  }
}

Future<void> populateDatabase() async {
  try {
    // Fetch data from the API
    final List<ParkingLot> parkingLots = await getParkingLots();
    final List<GiraStation> giraStations = await getGiraStations(); 

    // Save the fetched data to the local database
    await saveParkingLotsToDatabase(parkingLots);
    await saveGiraStationsToDatabase(giraStations); 

  } catch (e) {
    print('Error populating database: $e');
  }
}

Future<void> saveParkingLotsToDatabase(List<ParkingLot> parkingLots) async {
  final Future<Database> database = openDatabase(
    // Set the path to your local database file
    join(await getDatabasesPath(), 'parking_lots_database.db'),
    onCreate: (db, version) {
      // Create the parking lots table
      return db.execute(
        'CREATE TABLE parking_lots(id INTEGER PRIMARY KEY, name TEXT, capacity INTEGER)',
      );
    },
    version: 1,
  );

  final Database db = await database;

  // Insert each parking lot into the database
  for (final parkingLot in parkingLots) {
    await db.insert(
      'parking_lots',
      parkingLot.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

Future<void> saveGiraStationsToDatabase(List<GiraStation> giraStations) async {
  final Future<Database> database = openDatabase(
    // Set the path to your local database file
    join(await getDatabasesPath(), 'gira_stations_database.db'),
    onCreate: (db, version) {
      // Create the GIRA stations table
      return db.execute(
        'CREATE TABLE gira_stations(idStation TEXT PRIMARY KEY, numDocas INTEGER, numBicicletas INTEGER, desigComercial TEXT, updateDate TEXT, latitude TEXT, longitude TEXT)',
      );
    },
    version: 1,
  );

  final Database db = await database;

  // Insert each GIRA station into the database
  for (final giraStation in giraStations) {
    await db.insert(
      'gira_stations',
      giraStation.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}---
### Services/gira_station_manager
---
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sqflite/sqflite.dart';
import '../database_helper.dart';
import '../models/gira_station.dart';

class GiraStationManager {
  Future<List<GiraStation>> fetchAllGiraStations() async {
    try {
      print('Fetching GIRA stations from API...');
      final response = await http.get(
        Uri.parse('https://emel.city-platform.com/opendata/gira/station/list'),
        headers: {
          'api_key': dotenv.env['API_KEY']!,
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> json = jsonDecode(response.body);
        List<GiraStation> giraStations = json.map((item) => GiraStation.fromJson(item)).toList();

        print('Fetched ${giraStations.length} GIRA stations from API.');
        // Save the API data to the local database
        await saveGiraStationsToLocalDatabase(giraStations);

        return giraStations;
      } else {
        print('Failed to fetch GIRA stations from API with status code: ${response.statusCode}');
        throw Exception('Failed to load GIRA stations');
      }
    } catch (e) {
      print('Error fetching GIRA stations from API: $e');
      // Fetch from local database if API call fails
      return fetchAllGiraStationsFromDB();
    }
  }

  Future<List<GiraStation>> fetchAllGiraStationsFromDB() async {
    print('Fetching GIRA stations from local database...');
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> maps = await db.query('gira_stations');
    if (maps.isNotEmpty) {
      print('Fetched ${maps.length} GIRA stations from local database.');
      return List.generate(maps.length, (i) {
        return GiraStation.fromMap(maps[i]);
      });
    } else {
      print('No GIRA stations found in local database.');
      throw Exception('No GIRA stations found in local database');
    }
  }

  Future<void> saveGiraStationsToLocalDatabase(List<GiraStation> giraStations) async {
    final db = await DatabaseHelper().database;
    for (var station in giraStations) {
      await db.insert(
        'gira_stations',
        station.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    print('Saved ${giraStations.length} GIRA stations to local database.');
  }

  Future<GiraStation> fetchOneGiraStation(String stationId) async {
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> maps = await db.query('gira_stations', where: 'idStation = ?', whereArgs: [stationId]);
    if (maps.isNotEmpty) {
      return GiraStation.fromMap(maps.first);
    } else {
      throw Exception('No GIRA station found with id: $stationId');
    }
  }

  Future<void> updateGiraStation(GiraStation giraStation) async {
    final db = await DatabaseHelper().database;
    await db.update('gira_stations', giraStation.toMap(), where: 'idStation = ?', whereArgs: [giraStation.idStation]);
  }
}---
### Services/incidents_manager
---
import '../models/incident.dart';

class IncidentsManager {
  static Future<void> addIncident(Incident incident) async {
    await incident.save();
  }

  static Future<List<Incident>> getIncidentsForPark(String parkId) async {
    List<Incident> allIncidents = await Incident.fetchAll();
    return allIncidents.where((inc) => inc.parkId == parkId).toList();
  }

  static Future<List<Incident>> getIncidentsForParkFromDB(String parkId) async {
    // Fetch all incidents from the local database
    List<Incident> allIncidents = await Incident.fetchAll();

    // Filter the incidents for the given park
    List<Incident> parkIncidents = allIncidents.where((inc) => inc.parkId == parkId).toList();

    return parkIncidents;
  }

}
---
### Services/parking_lot_manager
---
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sqflite/sqflite.dart';
import '../database_helper.dart';
import '../models/parking_lot.dart';

class ParkingLotManager {
  Future<List<ParkingLot>> fetchAllParkingLots() async {
    final response = await http.get(
      Uri.parse('https://emel.city-platform.com/opendata/parking/lots'),
      headers: {
        'api_key': dotenv.env['API_KEY']!,
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);
      List<ParkingLot> parkingLots = json.map((item) => ParkingLot.fromJson(item)).toList();

      // Optionally, save the API data to the local database
      await saveParkingLotsToLocalDatabase(parkingLots);

      return parkingLots;
    } else {
      throw Exception('Failed to load parking lots');
    }
  }

  Future<List<ParkingLot>> fetchAllParkingLotsFromDB() async {
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> maps = await db.query('parking_lots');
    if (maps.isNotEmpty) {
      return List.generate(maps.length, (i) {
        return ParkingLot.fromMap(maps[i]);
      });
    } else {
      throw Exception('No parking lots found in local database');
    }
  }

  Future<void> saveParkingLotsToLocalDatabase(List<ParkingLot> parkingLots) async {
    final db = await DatabaseHelper().database;
    for (var lot in parkingLots) {
      await db.insert(
        'parking_lots',
        lot.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<ParkingLot> fetchOneParkingLot(String parkId) async {
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> maps = await db.query('parking_lots', where: 'idParque = ?', whereArgs: [parkId]);
    if (maps.isNotEmpty) {
      return ParkingLot.fromMap(maps.first);
    } else {
      throw Exception('No parking lot found with id: $parkId');
    }
  }

  Future<void> updateParkingLot(ParkingLot parkingLot) async {
    final db = await DatabaseHelper().database;
    await db.update('parking_lots', parkingLot.toMap(), where: 'idParque = ?', whereArgs: [parkingLot.idParque]);
  }

  Future<int> getFreeSlots(String parkId) async {
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> maps = await db.query('parking_lots', where: 'idParque = ?', whereArgs: [parkId]);
    if (maps.isNotEmpty) {
      return maps.first['freeSlots'];
    } else {
      throw Exception('No parking lot found with id: $parkId');
    }
  }
}
---
### Components/navigation_bar
---
import 'package:flutter/material.dart';
//import 'package:projeto_emel/Consts/Colors.dart';

class NewNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;
  final bool isAdmin;

  const NewNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
    required this.isAdmin,
  });

  @override
  Widget build(BuildContext context) {
    
    // Get screen width
    double screenWidth = MediaQuery.of(context).size.width;
    
    // Calculate font size based on screen width
    double fontSize = screenWidth * 0.03; // Adjust this value

    return BottomAppBar(
      elevation: 5,
      color: Theme.of(context).colorScheme.tertiary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _navBarItem(
            icon: Icons.dashboard,
            label: 'Dashboard',
            index: 0,
            context: context,
            fontSize: fontSize,
          ),
          _navBarItem(
            icon: Icons.list,
            label: 'List',
            index: 1,
            context: context,
            fontSize: fontSize,
          ),
          _navBarItem(
            icon: Icons.map,
            label: 'Map',
            index: 2,
            context: context,
            fontSize: fontSize,
          ),
          _navBarItem(
            icon: Icons.report_problem_outlined,
            label: 'Report',
            index: 3,
            context: context,
            fontSize: fontSize,
          ),
          if (isAdmin)
            _navBarItem(
              icon: Icons.admin_panel_settings,
              label: 'Admin',
              index: 4,
              context: context,
              fontSize: fontSize,
            ),
        ],
      ),
    );
  }

  Widget _navBarItem({
    required IconData icon,
    required String label,
    required int index,
    required BuildContext context,
    required double fontSize,
  }) {
    // Limit the maximum font size to a specific value
    double maxFontSize = 14.0;
    fontSize = fontSize > maxFontSize ? maxFontSize : fontSize;

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipOval(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => onItemSelected(index),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  width: 35,
                  height: 35,
                  alignment: Alignment.center,
                  child: Icon(
                    icon,
                    color: currentIndex == index ? Theme.of(context).primaryColor : Colors.grey,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
          FittedBox(
            child: Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
                color: currentIndex == index ? Theme.of(context).primaryColor : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}---
### models/gira_station
---
import 'package:sqflite/sqflite.dart';
import '../database_helper.dart';

class GiraStation {
  final String idStation;
  final int numDocas;
  final int numBicicletas;
  final String desigComercial;
  final String updateDate;
  final String latitude;
  final String longitude;

  GiraStation({
    required this.idStation,
    required this.numDocas,
    required this.numBicicletas,
    required this.desigComercial,
    required this.updateDate,
    required this.latitude,
    required this.longitude,
  });

  factory GiraStation.fromJson(Map<String, dynamic> json) {
    return GiraStation(
      idStation: json['id_station'],
      numDocas: json['num_docas'],
      numBicicletas: json['num_bicicletas'],
      desigComercial: json['desig_comercial'],
      updateDate: json['update_date'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idStation': idStation,
      'numDocas': numDocas,
      'numBicicletas': numBicicletas,
      'desigComercial': desigComercial,
      'updateDate': updateDate,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  Future<void> save() async {
    final db = await DatabaseHelper().database;
    await db.insert('gira_stations', toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<GiraStation>> fetchAll() async {
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> maps = await db.query('gira_stations');
    return List.generate(maps.length, (i) {
      return GiraStation(
        idStation: maps[i]['idStation'],
        numDocas: maps[i]['numDocas'],
        numBicicletas: maps[i]['numBicicletas'],
        desigComercial: maps[i]['desigComercial'],
        updateDate: maps[i]['updateDate'],
        latitude: maps[i]['latitude'],
        longitude: maps[i]['longitude'],
      );
    });
  }

  static Future<GiraStation> fetchOne(String stationId) async {
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> maps = await db.query('gira_stations', where: 'idStation = ?', whereArgs: [stationId]);
    if (maps.isNotEmpty) {
      return GiraStation.fromMap(maps.first);
    } else {
      throw Exception('No GIRA station found with id: $stationId');
    }
  }

  factory GiraStation.fromMap(Map<String, dynamic> map) {
    return GiraStation(
      idStation: map['idStation'],
      numDocas: map['numDocas'],
      numBicicletas: map['numBicicletas'],
      desigComercial: map['desigComercial'],
      updateDate: map['updateDate'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
}---
### models/user
---
import 'package:sqflite/sqflite.dart';
import '../database_helper.dart';

class User {
  String _name;
  String _password;
  String _licensePlate;
  bool _isAdmin;

  User({
    required String name,
    required String password,
    required String licensePlate,
    required bool isAdmin,
  })  : _name = name,
        _password = password,
        _licensePlate = licensePlate,
        _isAdmin = isAdmin;

  String get name => _name;
  String get password => _password;
  String get licensePlate => _licensePlate;
  bool get isAdmin => _isAdmin;

  set name(String name) {
    _name = name;
  }

  set password(String password) {
    _password = password;
  }

  set licensePlate(String licensePlate) {
    _licensePlate = licensePlate;
  }

  set isAdmin(bool isAdmin) {
    _isAdmin = isAdmin;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': _name,
      'password': _password,
      'licensePlate': _licensePlate,
      'isAdmin': _isAdmin ? 1 : 0,
    };
  }

  Future<void> save() async {
    final db = await DatabaseHelper().database;
    await db.insert('users', toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<User>> fetchAll() async {
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (i) {
      return User(
        name: maps[i]['name'],
        password: maps[i]['password'],
        licensePlate: maps[i]['licensePlate'],
        isAdmin: maps[i]['isAdmin'] == 1,
      );
    });
  }
}---
### models/incident
---
import 'package:sqflite/sqflite.dart';
import '../database_helper.dart';

class Incident {
  final String parkId;
  final String description;
  final double severity;
  final String timestamp;
  final String imagePath;
  final String incidentType; // Novo campo para tipo de incidente (EMEL ou GIRA)
  final String giraIncidentType; // Novo campo para tipo de incidente GIRA

  Incident({
    required this.parkId,
    required this.description,
    required this.severity,
    required this.timestamp,
    this.imagePath = '',
    required this.incidentType,
    required this.giraIncidentType,
  });

  Map<String, dynamic> toMap() {
    return {
      'parkId': parkId,
      'description': description,
      'severity': severity,
      'timestamp': timestamp,
      'imagePath': imagePath,
      'incidentType': incidentType,
      'giraIncidentType': giraIncidentType,
    };
  }

  Future<void> save() async {
    final db = await DatabaseHelper().database;
    await db.insert('incidents', toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Incident>> fetchAll() async {
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> maps = await db.query('incidents');
    return List.generate(maps.length, (i) {
      return Incident(
        parkId: maps[i]['parkId'],
        description: maps[i]['description'],
        severity: maps[i]['severity'],
        timestamp: maps[i]['timestamp'],
        imagePath: maps[i]['imagePath'],
        incidentType: maps[i]['incidentType'],
        giraIncidentType: maps[i]['giraIncidentType'],
      );
    });
  }
}---
### models/parking_lot
---
import 'package:sqflite/sqflite.dart';
import '../database_helper.dart';

class ParkingLot {
  final String idParque;
  final String nome;
  final int activo;
  final int idEntidade;
  final int capacidadeMax;
  final int ocupacao;
  final String dataOcupacao;
  final String latitude;
  final String longitude;
  final String tipo;
  int freeSlots;

  ParkingLot({
    required this.idParque,
    required this.nome,
    required this.activo,
    required this.idEntidade,
    required this.capacidadeMax,
    required this.ocupacao,
    required this.dataOcupacao,
    required this.latitude,
    required this.longitude,
    required this.tipo,
    this.freeSlots = 0,
  });

  factory ParkingLot.fromJson(Map<String, dynamic> json) {
    return ParkingLot(
      idParque: json['id_parque'],
      nome: json['nome'],
      activo: json['activo'],
      idEntidade: json['id_entidade'],
      capacidadeMax: json['capacidade_max'],
      ocupacao: json['ocupacao'],
      dataOcupacao: json['data_ocupacao'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      tipo: json['tipo'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idParque': idParque,
      'nome': nome,
      'activo': activo,
      'idEntidade': idEntidade,
      'capacidadeMax': capacidadeMax,
      'ocupacao': ocupacao,
      'dataOcupacao': dataOcupacao,
      'latitude': latitude,
      'longitude': longitude,
      'tipo': tipo,
      'freeSlots': freeSlots,
    };
  }

  Future<void> save() async {
    final db = await DatabaseHelper().database;
    await db.insert('parking_lots', toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<ParkingLot>> fetchAll() async {
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> maps = await db.query('parking_lots');
    return List.generate(maps.length, (i) {
      return ParkingLot(
        idParque: maps[i]['idParque'],
        nome: maps[i]['nome'],
        activo: maps[i]['activo'],
        idEntidade: maps[i]['idEntidade'],
        capacidadeMax: maps[i]['capacidadeMax'],
        ocupacao: maps[i]['ocupacao'],
        dataOcupacao: maps[i]['dataOcupacao'],
        latitude: maps[i]['latitude'],
        longitude: maps[i]['longitude'],
        tipo: maps[i]['tipo'],
        freeSlots: maps[i]['freeSlots'],
      );
    });
  }

  factory ParkingLot.fromMap(Map<String, dynamic> map) {
    return ParkingLot(
      idParque: map['idParque'],
      nome: map['nome'],
      activo: map['activo'],
      idEntidade: map['idEntidade'],
      capacidadeMax: map['capacidadeMax'],
      ocupacao: map['ocupacao'],
      dataOcupacao: map['dataOcupacao'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      tipo: map['tipo'],
      freeSlots: map['freeSlots'],
    );
  }

  static Future<ParkingLot> fetchOne(String parkId) async {
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> maps = await db.query('parking_lots', where: 'idParque = ?', whereArgs: [parkId]);
    if (maps.isNotEmpty) {
      return ParkingLot.fromMap(maps.first);
    } else {
      throw Exception('No parking lot found with id: $parkId');
    }
  }

  String getFreeSlotsInfo() {
    if (freeSlots < 0) {
      return 'Information is not available at the moment';
    } else {
      return '$freeSlots';
    }
  }


}
---
