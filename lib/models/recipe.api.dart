import 'dart:convert';
import 'package:chefitup/models/recipe.dart';
import 'package:http/http.dart' as http;
import 'package:chefitup/dotenv_loader.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    await loadEnv(); // Load environment variables

    var uri = Uri.https(
      'yummly2.p.rapidapi.com',
      '/feeds/list',
      {"limit": "18", "start": "0", "tag": "list.recipe.popular"},
    );

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": dotenv.env['RAPIDAPI_KEY'] ?? "",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true",
    });

    Map data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}