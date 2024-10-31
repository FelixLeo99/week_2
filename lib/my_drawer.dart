import 'package:flutter/material.dart';
import 'package:week_2/main.dart';
import 'package:week_2/basket.dart';
import 'package:week_2/about.dart';
import 'package:week_2/student_list.dart';
import 'package:week_2/add_recipe.dart';
import 'package:week_2/quiz.dart';
import 'package:week_2/high_score.dart';
import 'package:week_2/popular_movie.dart';
import 'package:week_2/popular_actor.dart';

Widget myDrawer(BuildContext context, String userId) {
  return Drawer(
    elevation: 16.0,
    child: Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: const Text("xyz"),
          accountEmail: Text(userId),
          currentAccountPicture: const CircleAvatar(
            backgroundImage: NetworkImage("https://i.pravatar.cc/150"),
          ),
        ),
        ListTile(
          title: const Text("Inbox"),
          leading: const Icon(Icons.inbox),
          onTap: () {},
        ),
        ListTile(
          title: const Text("My Basket"),
          leading: const Icon(Icons.shopping_basket),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BasketPage()),
            );
          },
        ),
        ListTile(
          title: const Text("About"),
          leading: const Icon(Icons.help),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const About()),
            );
          },
        ),
        ListTile(
          title: const Text("Student List"),
          leading: const Icon(Icons.list),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const StudentList()),
            );
          },
        ),
        ListTile(
          title: const Text("Add Recipe"),
          leading: const Icon(Icons.add),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddRecipe()),
            );
          },
        ),
        ListTile(
          title: const Text("Quiz"),
          leading: const Icon(Icons.question_answer),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuizPage()),
            );
          },
        ),
        ListTile(
          title: const Text("High Score"),
          leading: const Icon(Icons.star),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HighScoreScreen()),
            );
          },
        ),
        ListTile(
          title: const Text("Popular Movie"),
          leading: const Icon(Icons.movie),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PopularMovie()),
            );
          },
        ),
        ListTile(
          title: const Text("Popular Actor"),
          leading: const Icon(Icons.person),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PopularActor()),
            );
          },
        ),
        ListTile(
          title: const Text("LogOut"),
          leading: const Icon(Icons.logout),
          onTap: () {
            doLogout(context);
          },
        ),
      ],
    ),
  );
}
