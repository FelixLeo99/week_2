import 'package:flutter/material.dart';
import 'class/recipe.dart';
import 'item_basket.dart';

class BasketPage extends StatelessWidget {
  BasketPage({super.key}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basket"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Your basket",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: widRecipes(),
            ),
            const Divider(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> widRecipes() {
    List<Widget> temp = [];
    int i = 0;

    while (i < recipes.length) {
      Widget w = Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 153, 90, 90).withOpacity(0.5),
              spreadRadius: -6,
              blurRadius: 8,
              offset: const Offset(8, 7),
            ),
          ],
        ),
        child: Card(
          child: Column(
            children: [
              // Recipe Name
              Container(
                margin: const EdgeInsets.all(15),
                child: Text(
                  recipes[i].name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),

              // Image
              Image.network(recipes[i].photo),

              // Category and Spicy Icon Row
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Display category
                    Chip(
                      label: Text(
                        recipes[i].category,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.blueAccent,
                    ),
                    const SizedBox(width: 10), // Spacing between chips

                    // Display spicy icon if spicy
                    if (recipes[i].spicy)
                      const Icon(
                        Icons.whatshot,
                        color: Colors.red,
                      ),
                  ],
                ),
              ),

              // Description
              Container(
                margin: const EdgeInsets.all(20),
                child: Text(
                  recipes[i].desc,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      );
      temp.add(w);
      i++;
    }

    return temp;
  }
}
