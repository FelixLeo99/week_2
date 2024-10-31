import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:week_2/class/pop_movie.dart';

class PopularMovie extends StatefulWidget {
  const PopularMovie({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PopularMovieState();
  }
}

class _PopularMovieState extends State<PopularMovie> {
  List<PopMovie> PMs = [];

  Future<String> fetchData() async {
    final response = await http
        .get(Uri.parse("https://ubaya.xyz/flutter/160721006/movielist.php"));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to read API');
    }
  }

  void bacaData() {
    fetchData().then((value) {
      Map<String, dynamic> json = jsonDecode(value);
      setState(() {
        PMs = (json['data'] as List)
            .map((movie) => PopMovie.fromJson(movie))
            .toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    bacaData();
  }

  Widget DaftarPopMovie(List<PopMovie> popMovs) {
    if (popMovs.isNotEmpty) {
      return ListView.builder(
          itemCount: popMovs.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.movie, size: 30),
                    title: Text(popMovs[index].title),
                    subtitle: Text(popMovs[index].overview),
                    trailing: Text('Rating: ${popMovs[index].voteAverage}'),
                  ),
                ],
              ),
            );
          });
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 200,
        child: DaftarPopMovie(PMs),
      ),
    );
  }
}
