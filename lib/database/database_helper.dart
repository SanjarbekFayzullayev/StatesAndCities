import 'dart:io';
import 'package:capitals_app/moduls/words.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import 'package:flutter/widgets.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._intance();
  static Database? _db;

  DatabaseHelper._intance();

  Future<Database?> get db async {
    return _db ?? await _intDB();
  }

  final String tableName = 'capitals';
  final String colId = 'id';
  final String colName='name';
  final String colIso3='iso3';
  final String colIso2='iso2';
  final String colNumeric_code='numeric_code';
  final String colPhone_code='phone_code';
  final String colCapital='capital';
  final String colCurrency='currency';
  final String colCurrency_name='currency_name';
  final String colCurrency_symbol='currency_symbol';
  final String colTld='tld';
  final String colNative='native';
  final String colRegion='region';
  final String colSubregion='subregion';
  final String colLatitude='latitude';
  final String colLongitude='longitude';
  final String colEmoji='emoji';
  final String colEmojiU='emojiU';

  Future<Database?> _intDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = "${directory.path}capitals.db";
    _db = await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, version) async {
        await db.execute("CREATE TABLE $tableName("
            "$colId INTEGER PRIMARY KEY,"
            "$colName TEXT,"
            "$colIso3 TEXT,"
            "$colIso2 TEXT,"
            "$colNumeric_code TEXT,"
            "$colPhone_code TEXT,"
            "$colCapital TEXT,"
            "$colCurrency TEXT,"
            "$colCurrency_name TEXT,"
            "$colCurrency_symbol TEXT,"
            "$colTld TEXT,"
            "$colNative TEXT,"
            "$colRegion TEXT,"
            "$colSubregion TEXT,"
            "$colLatitude TEXT,"
            "$colLongitude TEXT,"
            "$colEmoji TEXT,"
            "$colEmojiU TEXT"


            ")");
      },
    );
    return _db;
  }

  Future<Words> insert(Words word) async {
    final data = await db;
    word.id = await data?.insert(tableName, word.toMap());
    return word;
  }

  Future<List<Map<String, Object?>>?> getWordsMap({String? word}) async {
    final data = await db;
    final List<Map<String, Object?>>? result;
    if (word == null) {
      result = await data?.query(tableName);
    } else {
      result = await data
          ?.query(tableName, where: "name LIKE ?", whereArgs: ["$word%"]);
    }
    return result;
  }

  Future<List<Words>> getWords() async {
    final List<Map<String, Object?>>? wordMap = await getWordsMap();
    final List<Words> words = [];
    wordMap?.forEach((element) {
      words.add(Words.fromMap(element));
    });
    return words;
  }

  Future<int?> update(Words word) async {
    final data = await db;
    return await data?.update(tableName, word.toMap(),
        where: "$colId = ?", whereArgs: [word.id]);
  }

  Future<int?> delete(int wordId) async {
    final data = await db;
    return await data?.delete(
      tableName,
      where: "$colId = ?",
      whereArgs: [wordId],
    );
  }

  clearUserTable() async {
    final data = await db;
    return await data?.rawDelete("DELETE FROM $tableName");
  }

  Future<void> loadDB(context) async {
    print("DATABASE LOADED");
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/states_db_json/capitals.json");
    final jsonResult = jsonDecode(data);
    List<Words> capitals = jsonResult.map<Words>((data) {
      return Words.fromJson(data);
    }).toList();


    for (var word in capitals) {
      await insert(word);
    }
    //
    saveState();
  }
  Future<void>saveState()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    await preferences.setBool("save", true);
  }
  Future<List<Words>> getWordsLike(String word) async {
    final List<Map<String, Object?>>? wordMap = await getWordsMap(word: word);
    final List<Words> words = [];
    wordMap?.forEach((element) {
      words.add(Words.fromMap(element));
    });
    return words;
  }
}
