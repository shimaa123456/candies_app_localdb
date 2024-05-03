import 'dart:developer';
import 'package:candies_db/features/dashboard/modules/users/model/user_model.dart';
import 'package:candies_db/features/dashboard/modules/cart/model/cart_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepo {
  late Database myObjectDB;
  Future<void> initDB() async {
    myObjectDB = await openDatabase(
      (await getDatabasesPath()) + '/cookie.db',
      version: 1, // Updated version to reflect schema changes
      onCreate: (db, version) async {
        // Create user table (unchanged)
        await db.execute('''
          CREATE TABLE user (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            address TEXT, 
            phone TEXT
          )''');

        // Create cart table
        await db.execute('''
          CREATE TABLE cart (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            image TEXT,
            name TEXT NOT NULL,
            totalPrice REAL NOT NULL,
            itemCount INTEGER NOT NULL
          )''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        // Handle database upgrades if necessary (optional)
        if (oldVersion < newVersion) {
          // Add migration logic here
        }
      },
    );
  }

  Future<List<UserModel>> fetchUsers() async {
    log((await myObjectDB.getVersion()).toString());
    return (await myObjectDB.query('user'))
        .map((e) => UserModel.fromJson(e))
        .toList();
  }

  Future<void> insertUser(String name, String address, String phone) async {
    await myObjectDB.insert('user', {
      'name': name,
      'address': address,
      'phone': phone,
    });
  }

  Future<void> deleteUser({required id}) async {
    myObjectDB.delete('user', where: 'id=?', whereArgs: [id]);
  }

  Future<List<CartModel>> fetchCartItems() async {
    log((await myObjectDB.getVersion()).toString());
    return (await myObjectDB.query('cart'))
        .map((e) => CartModel.fromJson(e))
        .toList();
  }

  Future<void> insertCartItem(
      String image, String name, double totalPrice, int itemCount) async {
    await myObjectDB.insert('cart', {
      'image': image,
      'name': name,
      'totalPrice': totalPrice,
      'itemCount': itemCount,
    });
  }

  Future<void> deleteCartItem({required id}) async {
   myObjectDB.delete('cart', where: 'id=?', whereArgs: [id]);
  }
}
