import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  static final DatabaseHelper _singleton = DatabaseHelper._internal();
  factory DatabaseHelper() => _singleton;

  SharedPreferences? _preferences;

  DatabaseHelper._internal();

  Future<SharedPreferences> get preferences async {
    if (_preferences != null) {
      return _preferences!;
    }

    _preferences = await SharedPreferences.getInstance();
    return _preferences!;
  }

  Future<void> updateGameState(Map<String, dynamic> gameState) async {
    final prefs = await preferences;
    await prefs.setString('gameState', jsonEncode(gameState));
  }

  Future<Map<String, dynamic>> loadGameState() async {
    final prefs = await preferences;
    final gameStateString = prefs.getString('gameState');
    if (gameStateString != null) {
      return jsonDecode(gameStateString);
    } else {
      // Return initial game state if no saved state is found
      return {'veloNums': 0, 'multiplier': 1};
    }
  }
}
