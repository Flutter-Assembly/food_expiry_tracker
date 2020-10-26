import 'dart:async';
import 'package:food_expiry_tracker/helpers/database_helper.dart';
import 'package:food_expiry_tracker/models/food_model.dart';
import 'package:sqflite/sqflite.dart';

import '../models/food_model.dart';

class FoodService{
  DatabaseHelper _dbHelper = DatabaseHelper.instance;

  Future<int> insert(Food food) async { //returns number of items inserted as an integer
    Database db = await _dbHelper.database; 
    return db.insert(Food.tblFood, food.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
  }

  Future<int> update(int id, Food food) async{ // returns the number of rows updated
    Database db = await _dbHelper.database;   
    int result = await db.update(
      Food.tblFood, 
      food.toMap(),
      where: '${Food.colId} = ?',
      whereArgs: [id]
    );    
    return result;
  }

  Future<int> delete(int id) async{ //returns number of items deleted
    Database db = await _dbHelper.database;
    int result = await db.delete(
      Food.tblFood,
      where: '${Food.colId} = ?',
      whereArgs: [id] // use whereArgs to avoid SQL injection
    );
    return result;
  }

  Future<List<Food>> fetchAll() async { //returns number of items inserted as an integer
    Database db = await _dbHelper.database; 
    List<Map> foods = await db.query(Food.tblFood);
    return foods.length == 0 ? 
    [] : 
    foods.map((food) => Food.fromMap(food)).toList();
  }

  Future<Food> fetchOne(int id) async { //returns number of items inserted as an integer
    Database db = await _dbHelper.database; 
    List<Map> foods = await db.query(
      Food.tblFood,
      where: '${Food.colId} = ?',
      whereArgs: [id]
    );
    return foods.length > 0 ? 
    Food.fromMap(foods.first) : 
    null;
  }

}