import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/luffy kaido.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //avatar
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(blurRadius: 30, color: Colors.black)
                ],
                image: const DecorationImage(
                  image: AssetImage('assets/images/shanks.jpg'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.indigo,
                  width: 1,
                ),
              ),
            ),
          ),
          //quotes
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(top: 90),
              width: 300,
              height: 300,
              child: const Center(
                child: Text(
                  "\"Jika jalannya terlihat terlalu mudah mungkin kamu berada di jalan yang salah\"",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 200),
              width: 300,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  "-Akagami No Shanks-",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
