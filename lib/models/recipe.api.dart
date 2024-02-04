import 'dart:convert';
import 'package:chefitup/models/recipe.dart';
import 'package:http/http.dart' as http;
import 'package:chefitup/dotenv_loader.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});
    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "37bb63d5d3msh0309b725a53d6cbp13d491jsn497fa6459eb1",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });
    Map data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }
    return Recipe.recipesFromSnapshot(_temp);
  }
}