### /home/fabio/projetos/computacaoMovel/projeto-flutter-22100444-22103261/lib/main
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
### /home/fabio/projetos/computacaoMovel/projeto-flutter-22100444-22103261/lib/database_helper
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
