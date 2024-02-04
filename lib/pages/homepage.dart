import 'package:flutter/material.dart';
import 'package:chefitup/pages/favorites.dart';
import 'package:chefitup/pages/profile.dart';
import 'package:chefitup/pages/shoppinglist.dart';
import 'package:chefitup/components/recipe_card.dart';
import 'package:chefitup/models/recipe.api.dart';
import 'package:chefitup/models/recipe.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 0;

  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }
  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    }
  );

  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text(
              'Chef It Up',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              )
            ),
          ],
        ),
        backgroundColor: Colors.grey.shade300,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [ 
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "List"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile",),
        ],
        iconSize: 25,
        fixedColor: Colors.brown.shade200,
        currentIndex: selectedIndex,
        onTap: (index) { 
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
      body:  _buildPage(selectedIndex),
      );
  }

Widget _buildPage(int index) {
    //final size = MediaQuery.of(context).size;

    switch (index) {
      case 0:
        // Return the widget for the first page (Home Page)
        return _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipes[index].name,
                      cookTime: _recipes[index].totalTime,
                      rating: _recipes[index].rating.toString(),
                      thumbnailUrl: _recipes[index].images);
                },
              );
          
      case 1:
        // Return the widget for the second page (Favorites)
        return const Favorites();
      
      case 2:
        // Return the widget for the second page (List)
        return GroceryList();

      case 3:
        // Return the widget for the second page (Profile)
        return const Profile();     

      default:
        return Container(); // Handle default case or return an empty container
    }
  }
}