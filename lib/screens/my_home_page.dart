import 'package:animeworld/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:animeworld/components/custom_classes.dart';
import 'dart:math' as math;
import 'package:animeworld/components/build_app_bar.dart';
import 'package:animeworld/screens/the_anime_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController;
  int initialpage = 0;
  List<AnimeListClass> myModels;
  int isSelected = 0;
  List<String> categories = [
    'airing',
    'upcoming',
    'tv',
    'movie',
    'ova',
    'special'
  ];
  String selectedCategory = 'airing';
  bool dataFetched = false;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(viewportFraction: 0.8, initialPage: initialpage);
    fetchCards();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            buildContainerForCategories(),
            dataFetched == true
                ? buildCards()
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ],
        ),
      ),
    );
  }

  Padding buildCards() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              initialpage = value;
            });
          },
          controller: _pageController,
          itemCount: myModels.length,
          itemBuilder: (context, index) => AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 0;
              if (_pageController.position.haveDimensions) {
                value = index - _pageController.page;
                value = (value * 0.038).clamp(-1, 1);
              }
              return AnimatedOpacity(
                duration: Duration(milliseconds: 350),
                opacity: initialpage == index ? 1 : 0.4,
                child: Transform.rotate(
                  angle: math.pi * value,
                  child: buildMovieCard(index, context),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Container buildMovieCard(int index, BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TheAnime(
                        id: myModels[index].id,
                      )));
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [kDefaultShadow],
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(myModels[index].image_url))),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              child: Text(
                myModels[index].title,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildContainerForCategories() {
    return Container(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = index;
                      selectedCategory = categories[index];
                      dataFetched = false;
                      initialpage = 0;
                    });
                    fetchCards();
                  },
                  child: Column(
                    children: <Widget>[
                      Text(
                        categories[index],
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.w600,
                            color: isSelected == index
                                ? kTextColor
                                : Colors.black.withOpacity(0.6)),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                        height: 6,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isSelected == index
                              ? kSecondaryColor
                              : Colors.transparent,
                        ),
                      )
                    ],
                  ),
                ),
              )),
    );
  }

  void fetchCards() async {
//    String cat = selectedCategory;
    print(selectedCategory);
    String url = 'https://api.jikan.moe/v3/top/anime/1/$selectedCategory';
    final response = await http.get(url);
    final jsonResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      print('f');
      setState(() {
        dataFetched = true;
        myModels = (jsonResponse["top"] as List)
            .map((i) => AnimeListClass.fromJson(i))
            .toList();
      });
    } else {
      throw Exception('Failed to load.');
    }
  }
}
