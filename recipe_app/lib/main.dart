import 'package:flutter/material.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App Demo',
      theme: ThemeData(
        primarySwatch: Colors.green, // Change the primary color
      ),
      home: HomeScreen(),
    );
  }
}

class Recipe {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> instructions;

  Recipe({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.ingredients,
    required this.instructions,
  });
}

class HomeScreen extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe(
      title: 'Pancakes',
      description: 'Delicious and fluffy pancakes.',
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
      ingredients: [
        '1 cup all-purpose flour',
        '2 tablespoons sugar',
        '1 tablespoon baking powder',
        '1/2 teaspoon salt',
        '1 cup milk',
        '1 large egg',
        '2 tablespoons melted butter'
      ],
      instructions: [
        'In a large bowl, whisk together the flour, sugar, baking powder, and salt.',
        'In another bowl, whisk together the milk, egg, and melted butter.',
        'Pour the wet ingredients into the dry ingredients and mix until just combined.',
        'Heat a nonstick skillet or griddle over medium heat.',
        'Pour 1/4 cup of batter onto the skillet for each pancake.',
        'Cook until bubbles form on the surface, then flip and cook until golden brown.',
        'Serve with your favorite toppings.'
      ],
    ),
    Recipe(
      title: 'Classic Spaghetti Carbonara',
      description:
          'A traditional Italian pasta dish with eggs, cheese, and pancetta.',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
      ingredients: [
        '8 ounces spaghetti',
        '2 large eggs',
        '1 cup grated Pecorino Romano cheese',
        '4 ounces pancetta',
        '2 cloves garlic',
        'Salt and black pepper',
        'Chopped parsley, for garnish'
      ],
      instructions: [
        'Cook the spaghetti in a large pot of salted boiling water until al dente.',
        'While the pasta cooks, whisk together the eggs, grated cheese, and black pepper in a bowl.',
        'In a skillet, cook the pancetta until crispy, then add minced garlic.',
        'Reserve some pasta water, then drain the pasta and add it to the skillet.',
        'Pour the egg and cheese mixture over the pasta, tossing quickly to combine.',
        'If needed, add a splash of reserved pasta water to create a creamy sauce.',
        'Serve immediately with additional grated cheese and chopped parsley.'
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe App Demo'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailScreen(recipe: recipe),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 4, // Add a subtle shadow
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: 'recipeImage${recipe.title}',
                    child: Image.network(
                      recipe.imageUrl,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      recipe.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'recipeImage${recipe.title}',
              child: Image.network(
                recipe.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ingredients',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: recipe.ingredients.map((ingredient) {
                      return Text(
                        '- $ingredient',
                        style: TextStyle(fontSize: 16),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Instructions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: recipe.instructions.map((instruction) {
                      return Text(
                        instruction,
                        style: TextStyle(fontSize: 16),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
