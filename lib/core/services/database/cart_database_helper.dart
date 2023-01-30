import 'package:path/path.dart';
import 'package:shop_app_mvvm_getx_besia/core/utils/constance.dart';
import 'package:sqflite/sqflite.dart';

import '../../../model/cart_product_model.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();

  static final CartDatabaseHelper databaseHelper = CartDatabaseHelper._();
  static  Database? _dataBase;


  Future<Database?> get database async {
    if (_dataBase != null) {
      return _dataBase;
    }
      _dataBase = await _initDb();
      return _dataBase;

  }

  _initDb() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(path, version: 1,

        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE $tableCartProduct (
      $columnName TEXT NOT NULL,
      $columnImage TEXT NOT NULL,
      $columnPrice TEXT NOT NULL,
      $columnQuantity INTEGER NOT NULL)
      ''');
    });
  }

  ///get all product
  Future<List<CartProductModel>> getAllProduct() async {
    Database? dbClint = await database;
    List<Map> maps = await dbClint!.query(tableCartProduct);
    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];
    return list;
  }

  ///insert into database
  insertIntoDatabase(CartProductModel cartProductModel) async {
    Database? dbClient = await database;
    await dbClient!.insert(
      tableCartProduct,
      cartProductModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }
}
