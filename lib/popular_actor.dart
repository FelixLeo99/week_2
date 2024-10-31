// popularactor.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:week_2/class/pop_actor.dart';

class PopularActor extends StatefulWidget {
  const PopularActor({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PopularActorState();
  }
}

class _PopularActorState extends State<PopularActor> {
  List<PopActor> actors = [];

  Future<String> fetchData() async {
    final response = await http
        .get(Uri.parse("https://ubaya.xyz/flutter/160721006/actorlist.php"));
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
        actors = (json['data'] as List)
            .map((actor) => PopActor.fromJson(actor))
            .toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    bacaData();
  }

  Widget DaftarPopActor(List<PopActor> actorList) {
    if (actorList.isNotEmpty) {
      return ListView.builder(
          itemCount: actorList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: const Icon(Icons.person, size: 30),
                title: Text(actorList[index].personName),
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
        title: const Text('Popular Actors'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 200,
        child: DaftarPopActor(actors),
      ),
    );
  }
}
