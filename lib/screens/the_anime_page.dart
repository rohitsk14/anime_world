import 'package:animeworld/components/custom_classes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:animeworld/constants.dart';
import 'package:animeworld/components/build_app_bar.dart';

class TheAnime extends StatefulWidget {
  final id;

  const TheAnime({Key key, this.id}) : super(key: key);
  @override
  _TheAnimeState createState() => _TheAnimeState();
}

class _TheAnimeState extends State<TheAnime> {
  TheAnimeClass Anime;
  bool dataFetched = false;
  List<String> genrelist = [
    'airing',
    'upcoming',
    'tv',
    'movie',
    'ova',
    'special'
  ];
  @override
  void initState() {
    fetchAnime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: dataFetched == true
          ? ListView(
              children: <Widget>[
                Container(
                  height: size.height * 0.5,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: size.height * 0.5 - 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(Anime.image_url),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          width: size.width * 0.9,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50),
                                topRight: Radius.circular(50),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 6),
                                  blurRadius: 50,
                                  color: Color(0xff12153d).withOpacity(0.2),
                                )
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '#' + Anime.rank.toString(),
                                    style: kLabelText,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Rank",
                                    style: kLabelText.copyWith(
                                        color: Colors.black54),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    Anime.score.toString(),
                                    style: kLabelText,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Score",
                                    style: kLabelText.copyWith(
                                        color: Colors.black54),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    Anime.favorites.toString(),
                                    style: kLabelText,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Favourites",
                                    style: kLabelText.copyWith(
                                        color: Colors.black54),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          Anime.title,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          Anime.english_title,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.black54),
                        ),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                  height: 36,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Anime.genres.length,
                    itemBuilder: (context, index) => Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                      padding: EdgeInsets.symmetric(
                          vertical: kDefaultPadding / 4,
                          horizontal: kDefaultPadding),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black54),
                      ),
                      child: Center(
                        child: Text(
                          Anime.genres[index].name,
                          style: TextStyle(
                              color: kTextLightColor.withOpacity(1),
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                Container(
                  padding: EdgeInsets.only(left: kDefaultPadding),
                  child: Text(
                    "Synopsis",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Text(
                    Anime.synopsis,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Status",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            Anime.status,
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Rating",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            Anime.rating,
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Aired",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            Anime.aired,
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  void fetchAnime() async {
    int id = widget.id;
    String url = 'https://api.jikan.moe/v3/anime/$id/';
    final response = await http.get(url);
    final jsonResponse = json.decode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() {
        dataFetched = true;
        print("fetched1");
        Anime = TheAnimeClass.fromJson(jsonResponse);
        print("fetched2");
//        print(Anime.genres);
      });
    } else {
      throw Exception('Failed to load.');
    }
  }
}
