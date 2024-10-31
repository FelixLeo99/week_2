import 'package:flutter/material.dart';
import 'student_detail.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student List"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const StudentDetail(studentNumber: 1)),
                );
              },
              child: const Text("Student #1"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const StudentDetail(studentNumber: 2)),
                );
              },
              child: const Text("Student #2"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const StudentDetail(studentNumber: 3)),
                );
              },
              child: const Text("Student #3"),
            ),
          ],
        ),
      ),
    );
  }
}
