import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlbrite/sqlbrite.dart';
import 'package:synchronized/synchronized.dart';

import '../model/product.dart';
import '../model/user.dart';

class ProductCache {
  static const _databaseName = 'Stationary.db';
  static const _databaseVersion = 1;
  static String tableProduct = 'product';
  static String tableUser = 'user';
  static String columnId = '_id';
  static String columnName = 'name';
  static String columnDescription = 'description';
  static String columnPrice = 'price';
  static String columnPackageAmount = 'package';
  static String columnMeasurement = 'measurement';
  static String columnIndividualQuantity = 'quantity';
  static String columnCategory = 'category';
  static String columnEmail = 'email';
  static String columnPhoneNumber = 'phoneNumber';

  static late BriteDatabase _streamDatabase;

  ProductCache._privateConstructor();
  static final ProductCache instance = ProductCache._privateConstructor();

  static var lock = Lock();
  static Database? _database;

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tableProduct (
      $columnId TEXT PRIMARY KEY,
      $columnName TEXT,
      $columnDescription TEXT,
      $columnPrice REAL,
      $columnPackageAmount REAL,
      $columnMeasurement TEXT,
      $columnIndividualQuantity REAL,
      $columnCategory TEXT
    )
    ''');

    await db.execute('''
    CREATE TABLE $tableUser (
      $columnId TEXT PRIMARY KEY,
      $columnName TEXT,
      $columnEmail TEXT,
      $columnPhoneNumber TEXT
    )
    ''');
  }

  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    Sqflite.setDebugModeOn(true);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    await lock.synchronized(() async {
      if (_database == null) {
        _database = await _initDatabase();
        _streamDatabase = BriteDatabase(_database!);
      }
    });
    return _database!;
  }

  Future<BriteDatabase> get streamDatabase async {
    await database;
    return _streamDatabase;
  }

  List<Product> parseProducts(List<Map<String, dynamic>> productList) {
    final products = <Product>[];
    productList.forEach((productMap) {
      final product = Product.fromJson1(productMap);
      products.add(product);
    });
    return products;
  }

  List<User> parseUsers(List<Map<String, dynamic>> userList) {
    final users = <User>[];
    userList.forEach((productMap) {
      final user = User.fromJson1(productMap);
      users.add(user);
    });
    return users;
  }

  Future<List<Product>> findAllProducts() async {
    final db = await instance.streamDatabase;
    final productList = await db.query(tableProduct);
    final products = parseProducts(productList);
    return products;
  }

  Future<User> findUser() async {
    final db = await instance.streamDatabase;
    final userList = await db.query(tableUser);
    final users = parseUsers(userList);
    return users[0];
  }

  Future insertProduct(Product product) async {
    final db = await instance.streamDatabase;
    return db.insert(tableProduct, product.toJson());
  }

  Future insertProducts(List<Product> products) async {
    products.forEach((product) {
      instance.insertProduct(product);
    });
  }

  Future insertUser(User user) async {
    final db = await instance.streamDatabase;
    return db.insert(tableUser, user.toJson());
  }

  Future<int> deleteProducts() async {
    final db = await instance.streamDatabase;
    return db.delete(tableProduct);
  }

  Future<int> deleteUsers() async {
    final db = await instance.streamDatabase;
    return db.delete(tableUser);
  }
}
