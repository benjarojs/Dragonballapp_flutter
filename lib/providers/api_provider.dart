import 'dart:convert';
import 'package:dragonball_app/models/character_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiProvider with ChangeNotifier {
  final  url = "dragonball-api.com";

  List<Character> characters = [];

  Future<void> getCharacters(int page) async {

    final result = await http.get(Uri.https(url,"/api/characters", {
      'page' : page.toString(),
    }));
    final response = characterResponseFromJson(result.body);
    characters.addAll(response.items!);
    notifyListeners();

    

    


  }

}
