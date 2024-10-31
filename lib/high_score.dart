import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HighScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('High Score'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _getHighScore(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final data = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Top User: ${data['top_user']}',
                      style: TextStyle(fontSize: 24)),
                  Text('Top Score: ${data['top_point']}',
                      style: TextStyle(fontSize: 24)),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Future<Map<String, dynamic>> _getHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    int? topPoint = prefs.getInt('top_point');
    String? topUser = prefs.getString('top_user');

    return {
      'top_point': topPoint ?? 0,
      'top_user': topUser ?? 'None',
    };
  }
}
