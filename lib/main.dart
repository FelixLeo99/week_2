import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week_2/add_recipe.dart';
import 'package:week_2/my_drawer.dart';
import 'package:week_2/about.dart';
import 'package:week_2/search.dart';
import 'package:week_2/history.dart';
import 'package:week_2/home.dart';
import 'package:week_2/basket.dart';
import 'package:week_2/student_list.dart';
import 'package:week_2/quiz.dart';
import 'package:week_2/login.dart';
import 'package:week_2/high_score.dart';
import 'package:week_2/popular_movie.dart';
import 'package:week_2/popular_actor.dart';

String active_user = "";

void doLogout(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove("user_id");

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => MyLogin()),
  );
}

void doLogin(String user_id, BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString("user_id", user_id);

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const MyApp()),
  );
}

Future<String> checkUser() async {
  final prefs = await SharedPreferences.getInstance();
  String user_id = prefs.getString("user_id") ?? '';
  return user_id;
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  checkUser().then((String result) {
    if (result == '') {
      runApp(MyLogin());
    } else {
      active_user = result;
      runApp(const MyApp());
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/basket': (context) => BasketPage(),
        '/about': (context) => const About(),
        '/student_list': (context) => const StudentList(),
        '/add_recipe': (context) => const AddRecipe(),
        '/quiz': (context) => QuizPage(),
        '/highscore': (context) => HighScoreScreen(),
        '/popular_movie': (context) => const PopularMovie(),
        '/popular_actor': (context) => const PopularActor(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  String _user_id = "";

  final List<Widget> _screens = [const Home(), const Search(), const History()];
  final List<String> _title = [
    'Home',
    'Search',
    'History',
    'About',
  ];

  @override
  void initState() {
    super.initState();
    checkUser().then((value) => setState(() {
          _user_id = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_title[_currentIndex]),
      ),
      drawer: myDrawer(
          context, _user_id), // Use the myDrawer widget from my_drawer.dart
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        fixedColor: Colors.teal,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "History",
            icon: Icon(Icons.history),
          ),
          BottomNavigationBarItem(
            label: "popular movie",
            icon: Icon(Icons.info),
          ),
          BottomNavigationBarItem(
            label: "popular actor",
            icon: Icon(Icons.info),
          ),
        ],
      ),
    );
  }
}
