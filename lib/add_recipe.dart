import 'package:flutter/material.dart';
import 'package:week_2/class/recipe.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({Key? key}) : super(key: key);

  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  final TextEditingController _recipeNameController = TextEditingController();
  final TextEditingController _recipeDescController = TextEditingController();
  final TextEditingController _recipePhotoController = TextEditingController();

  int _charleft = 0;
  String _recipeCategory = "Indonesian"; // Default category
  bool _isSpicy = false; // Spicy or not

  @override
  void initState() {
    super.initState();
    _recipeNameController.text = "your food name";
    _recipeDescController.text = "Description";
    _recipePhotoController.text = "";
    _charleft = 200 - _recipeDescController.text.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Recipe'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // TextField for Recipe Name
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _recipeNameController,
                  decoration: const InputDecoration(
                    labelText: 'Recipe Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              // TextField for Recipe Description
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _recipeDescController,
                  onChanged: (v) {
                    setState(() {
                      _charleft = 200 - v.length;
                    });
                  },
                  keyboardType: TextInputType.multiline,
                  minLines: 4,
                  maxLines: null,
                  decoration: const InputDecoration(
                    labelText: 'Recipe Description',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              // Displaying char left
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Char left: $_charleft",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),

              // TextField for Photo URL
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _recipePhotoController,
                  decoration: const InputDecoration(
                    labelText: 'Photo URL',
                    border: OutlineInputBorder(),
                  ),
                  onSubmitted: (v) {
                    setState(() {});
                  },
                ),
              ),

              // Display Image from URL
              if (_recipePhotoController.text.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.network(
                    _recipePhotoController.text,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text('Invalid Image URL');
                    },
                  ),
                ),

              // Dropdown for Recipe Category
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButton<String>(
                  value: _recipeCategory,
                  items: const [
                    DropdownMenuItem(
                      value: "Indonesian",
                      child: Text("Indonesian"),
                    ),
                    DropdownMenuItem(
                      value: "Japanese",
                      child: Text("Japanese"),
                    ),
                    DropdownMenuItem(
                      value: "Korean",
                      child: Text("Korean"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _recipeCategory = value!;
                    });
                  },
                  isExpanded: true,
                ),
              ),

              // Checkbox for Spicy or Not
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Text("Spicy?"),
                    Checkbox(
                      value: _isSpicy,
                      onChanged: (value) {
                        setState(() {
                          _isSpicy = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),

              // Submit Button
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(5),
                  backgroundColor:
                      MaterialStateProperty.resolveWith(getButtonColor),
                ),
                onPressed: () {
                  // Add Recipe with category and spicy field
                  recipes.add(Recipe(
                    id: recipes.length + 1,
                    name: _recipeNameController.text,
                    photo: _recipePhotoController.text,
                    desc: _recipeDescController.text,
                    category: _recipeCategory,
                    spicy: _isSpicy,
                  ));

                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Add Recipe'),
                      content: const Text('Recipe successfully added'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('SUBMIT'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getButtonColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return Colors.red;
    } else {
      return Colors.blue;
    }
  }
}
