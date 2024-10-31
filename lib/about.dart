import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});
  List<Widget> cats() {
    List<Widget> temp = [];
    int i = 0;
    while (i < 15) {
      Widget w = Image.network("https://placekitten.com/120/120?image=$i");
      temp.add(w);
      i++;
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(minHeight: 1200), // Menetapkan constraints
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  color: Colors.yellow,
                  alignment: Alignment.topCenter,
                  width: 200.0,
                  height: 200.0,
                  child: AspectRatio(
                    aspectRatio: 1 / 4,
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                ),
                Container(
                  color: Colors.cyan,
                  margin: const EdgeInsets.all(10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  height: 300,
                  width: 300,
                  child: const Card(
                    child: Center(
                      child: Text('Hello World!'),
                    ),
                  ),
                ),
                Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(blurRadius: 30, color: Colors.black)
                    ],
                    image: const DecorationImage(
                      image: NetworkImage('https://i.pravatar.cc/400?img=60'),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: Colors.indigo,
                      width: 10,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network('https://i.pravatar.cc/100?img=1'),
                    Image.network('https://i.pravatar.cc/100?img=2'),
                    Image.network('https://i.pravatar.cc/100?img=3'),
                  ],
                ),
                const Divider(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis
                      .horizontal, // Mengatur scroll direction menjadi horizontal
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network('https://i.pravatar.cc/100?img=4'),
                      Image.network('https://i.pravatar.cc/100?img=5'),
                      Image.network('https://i.pravatar.cc/100?img=6'),
                      Image.network('https://i.pravatar.cc/100?img=7'),
                      Image.network('https://i.pravatar.cc/100?img=8'),
                      Image.network('https://i.pravatar.cc/100?img=9'),
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                        "https://www.catschool.co/wp-content/uploads/2023/06/orange-tabby-kitten.png"),
                    Image.asset("assets/images/missing.png")
                  ],
                ),
                SizedBox(
                  height: 500,
                  child: GridView.count(crossAxisCount: 3, children: cats()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
