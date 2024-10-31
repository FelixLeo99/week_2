import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences
import 'class/question_obj.dart';
import 'package:week_2/high_score.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<QuestionObj> _questions = [];
  List<QuestionObj> _selectedQuestions =
      []; // To store selected random questions
  int _question_no = 0;
  int _point = 0;
  int _hitung = 60;
  final int _initValue = 60;
  Timer? _timer;
  bool _isRunning = false;
  String active_user = '';

  @override
  void initState() {
    super.initState();
    _loadUser();
    _questions.addAll([
      QuestionObj(
          "https://layartancep.id/assets/uploads/images/Marvel%20Cinematic%20Universe%20-%20Spider-Man.jpg",
          "Not a member of Avenger",
          'Ironman',
          'Spiderman',
          'Thor',
          'Hulk Hogan',
          'Hulk Hogan'),
      QuestionObj(
          "https://m.media-amazon.com/images/S/pv-target-images/45932677153362c32ad2fc5c0e69717ec416640aaa512dc91c4c20b247e613c2._SX1080_FMjpg_.jpg",
          "Not a member of Teletubbies",
          'Dipsy',
          'Patrick',
          'Laalaa',
          'Poo',
          'Patrick'),
      QuestionObj(
          "https://cdn1-production-images-kly.akamaized.net/RlLKDsyNXIzKCkjAFM0t_qN21Uw=/1200x675/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/1297072/original/034198300_1469418235-justice-league-movie-2017-cast.jpg",
          "Not a member of Justice League",
          'Batman',
          'Superman',
          'Flash',
          'Aquades',
          'Aquades'),
      QuestionObj(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-JfzJ9zEG_NfDPXKAdC7pw5JHdRUNB3d9FA&s",
          "What is Monkey D. Luffy's dream?",
          'To become the strongest swordsman',
          'To become the Pirate King',
          'To find the All Blue',
          'To cure any disease',
          'To become the Pirate King'),
    ]);
    _questions.shuffle(); // Shuffle questions
    _selectedQuestions = _questions.take(5).toList(); // Take 5 random questions
    startTimer();
  }

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      active_user = prefs.getString('user_id') ?? 'Unknown User';
    });
  }

  void startTimer() {
    _isRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_hitung > 0) {
          _hitung--;
        } else {
          finishQuiz();
        }
      });
    });
  }

  void checkAnswer(String answer) {
    setState(() {
      if (answer == _selectedQuestions[_question_no].answer) {
        _point += 100;
      }
      _question_no++;
      if (_question_no > _selectedQuestions.length - 1) {
        finishQuiz();
      } else {
        _hitung = _initValue; // Reset timer for next question
      }
    });
  }

  void finishQuiz() async {
    _timer?.cancel();
    _question_no = 0;

    // Get shared preferences
    final prefs = await SharedPreferences.getInstance();

    // Get the current top score and user
    int? topPoint = prefs.getInt('top_point');
    String? topUser = prefs.getString('top_user');

    // Check if current points are greater than top points
    if (topPoint == null || _point > topPoint) {
      // Save the new top point and user
      await prefs.setInt('top_point', _point);
      await prefs.setString('top_user', active_user);
    }

    // Navigate to HighScore screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HighScoreScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz with Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LinearPercentIndicator(
              center: Text(formatTime(_hitung)),
              width: MediaQuery.of(context).size.width,
              lineHeight: 20.0,
              percent: 1 - (_hitung / _initValue),
              backgroundColor: Colors.grey,
              progressColor: Colors.red,
            ),
            const SizedBox(height: 20),
            _buildImage(),
            const SizedBox(height: 20),
            Text(
              _selectedQuestions[_question_no].narration,
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            _buildAnswerButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Image.network(
      _selectedQuestions[_question_no].image,
      height: 200.0,
      width: 200.0,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Icon(
        Icons.error,
        size: 200.0,
      ),
    );
  }

  Widget _buildAnswerButtons() {
    return Column(
      children: [
        TextButton(
          onPressed: () =>
              checkAnswer(_selectedQuestions[_question_no].option_a),
          child: Text("A. " + _selectedQuestions[_question_no].option_a),
        ),
        TextButton(
          onPressed: () =>
              checkAnswer(_selectedQuestions[_question_no].option_b),
          child: Text("B. " + _selectedQuestions[_question_no].option_b),
        ),
        TextButton(
          onPressed: () =>
              checkAnswer(_selectedQuestions[_question_no].option_c),
          child: Text("C. " + _selectedQuestions[_question_no].option_c),
        ),
        TextButton(
          onPressed: () =>
              checkAnswer(_selectedQuestions[_question_no].option_d),
          child: Text("D. " + _selectedQuestions[_question_no].option_d),
        ),
      ],
    );
  }

  String formatTime(int hitung) {
    var minutes = (hitung ~/ 60).toString().padLeft(2, '0');
    var seconds = (hitung % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }
}
