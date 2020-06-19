import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:animeworld/custom_classes.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Anime> myModels;
  bool dataFetched = false;

  @override
  void initState() {
    super.initState();
    fetchCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Top Anime",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          child: dataFetched
              ? ListView.builder(
                  itemCount: myModels.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        print(myModels[i].id);
                      },
                      child: ListTile(
                        leading: Image.network(myModels[i].image_url),
                        title: Text('#' +
                            myModels[i].rank.toString() +
                            ' ' +
                            myModels[i].title),
                      ),
                    );
                  },
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }

  void fetchCards() async {
    final response =
        await http.get('https://api.jikan.moe/v3/top/anime/1/airing');
    final jsonResponse = json.decode(response.body);
    if (response.statusCode == 200) {
//      print(jsonResponse["top"]);
      setState(() {
        dataFetched = true;
        myModels = (jsonResponse["top"] as List)
            .map((i) => Anime.fromJson(i))
            .toList();
      });
    } else {
      throw Exception('Failed to load.');
    }
  }
}
