import 'package:flutter/material.dart';

class StudentDetail extends StatelessWidget {
  final int studentNumber;

  const StudentDetail({super.key, required this.studentNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student #$studentNumber"),
      ),
      body: Center(
        child: Image.network('https://i.pravatar.cc/300?img=$studentNumber'),
      ),
    );
  }
}
