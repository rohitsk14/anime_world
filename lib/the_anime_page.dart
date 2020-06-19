import 'package:animeworld/custom_classes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

class TheAnime extends StatelessWidget {
  Color BGColor = Color(0xffB8E3DB);
  TextStyle titleStyle = GoogleFonts.roboto(
      fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black);
  TextStyle contentStyle =
      GoogleFonts.roboto(fontSize: 15.0, fontWeight: FontWeight.w400);
  TextStyle titleStyle2 = GoogleFonts.roboto(
      fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.grey[700]);
  BoxDecoration containerDecorationStyle = BoxDecoration(
    color: Color(0xffB8E3DB),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.pink[500],
      appBar: AppBar(
        backgroundColor: BGColor,
        title: Text(
          "Anime Details",
        ),
      ),
//        https://cdn.myanimelist.net/images/anime/1764/106659.jpg
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              decoration: containerDecorationStyle,
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                        image: NetworkImage(
                            'https://cdn.myanimelist.net/images/anime/1764/106659.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Flexible(
                    flex: 3,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Kaguya-sama wa Kokurasetai?: Tensai-tachi no Renai Zunousen",
                          style: titleStyle,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "Kaguya-sama: Love is War Season 2",
                          style: titleStyle2,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Status: ',
                              style: titleStyle,
                              children: [
                                TextSpan(
                                    text: 'Currently Airing',
                                    style: contentStyle)
                              ]),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Aired: ',
                              style: titleStyle,
                              children: [
                                TextSpan(
                                    text: 'Apr 11, 2020 to Jun 27, 2020',
                                    style: contentStyle)
                              ]),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: containerDecorationStyle,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text('#22'),
                      Text(
                        'Rank',
                        style: titleStyle,
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text('8.85'),
                      Text(
                        'Score',
                        style: titleStyle,
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text('12'),
                      Text(
                        'Episodes',
                        style: titleStyle,
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
              decoration: containerDecorationStyle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: 'Synopsis: ',
                        style: titleStyle,
                        children: [
                          TextSpan(
                              text:
                                  "After a slow but eventful summer vacation, Shuchiin Academy's second term is now starting in full force. As August transitions into September, Miyuki Shirogane's birthday looms ever closer, leaving Kaguya Shinomiya in a serious predicament as to how to celebrate it. Furthermore, the tenure of the school's 67th student council is coming to an end. Due to the council members being in different classes, the only time Kaguya and Miyuki have to be together will soon disappear, putting all of their cunning plans at risk. A long and difficult election that will decide the fate of the new student council awaits, as multiple challengers fight for the coveted title of president. [Written by MAL Rewrite]",
                              style: contentStyle)
                        ]),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Rating: ',
                        style: titleStyle,
                        children: [
                          TextSpan(
                              text: 'PG-13 - Teens 13 or older',
                              style: contentStyle)
                        ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "Genre:",
              style: titleStyle,
            ),
            Wrap(
              spacing: 8.0,
//              runSpacing: 1.0,
              direction: Axis.horizontal,
              children: [
                'Comedy',
                'Psychological',
                'Romance',
                'School',
                'Seinen',
              ]
                  .map((String name) => GestureDetector(
                        onTap: () {
                          print(name);
                        },
                        child: Chip(
                          backgroundColor: Color(0xffB8E3DB),
                          avatar: CircleAvatar(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            child: Text(name.substring(0, 1)),
                          ),
                          label: Text(name),
                        ),
                      ))
                  .toList(),
            ),
            MaterialButton(
              onPressed: () {},
              color: BGColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
              child: Text(
                'Episodes',
                style: titleStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
