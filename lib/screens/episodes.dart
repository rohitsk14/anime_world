import 'package:flutter/material.dart';

class EpisodesList extends StatelessWidget {
  Color BGColor = Color(0xffB8E3DB);
  BoxDecoration containerDecorationStyle = BoxDecoration(
    color: Color(0xffB8E3DB),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Episodes'),
        backgroundColor: Color(0xffB8E3DB),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: x['episodes'].length,
            itemBuilder: (context, i) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 4.0),
                padding: EdgeInsets.symmetric(vertical: 4.0),
                decoration: containerDecorationStyle,
                child: ListTile(
                  leading: Text(
                    '#' + x['episodes'][i]['episode_id'].toString(),
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  title: Text(x['episodes'][i]['title']),
                  subtitle: Text('Aired On ' + x['episodes'][i]['aired']),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      x['episodes'][i]['filler']
                          ? Icon(Icons.done_all)
                          : Icon(Icons.clear),
                      Text(
                        'Filler',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

Map x = {
  "episodes": [
    {
      "episode_id": 1,
      "title":
          "Ai Hayasaka Wants to Stave Them Off / The Student Council Has Not Achieved Nirvana / Kaguya Wants to Get Married / Kaguya Wants to Celebrate",
      "title_japanese": "早坂愛は防ぎたい / 生徒会は神ってない / かぐや様は結婚したい / かぐや様は祝いたい",
      "title_romanji":
          "Hayasaka Ai wa Fusegitai / Seitokai wa Kamitte Nai / Kaguya-sama wa Kekkon Shitai / Kaguya-sama wa Iwaitai ",
      "aired": "2020-04-11T00:00:00+00:00",
      "filler": false,
      "recap": false,
      "video_url": null,
      "forum_url": "https://myanimelist.net/forum/?topicid=1834148"
    },
    {
      "episode_id": 2,
      "title":
          "Kaguya Wants to Know / Kaguya Wants to Give a Gift / Chika Fujiwara Wants to Confirm It",
      "title_japanese": "かぐや様は聞き出したい / かぐや様は贈りたい / 藤原千花は確かめたい",
      "title_romanji":
          "Kaguya-sama wa Kikidashitai / Kaguya-sama wa Okuritai / Fujiwara Chika wa Tashikametai ",
      "aired": "2020-04-18T00:00:00+00:00",
      "filler": false,
      "recap": false,
      "video_url": null,
      "forum_url": "https://myanimelist.net/forum/?topicid=1835477"
    },
    {
      "episode_id": 3,
      "title":
          "Miyuki Shirogane Wants to Gaze at the Moon / The 67th Student Council / Kaguya Doesn't Want to Say It",
      "title_japanese": "白銀御行は見上げたい / 第67期生徒会 / かぐや様は呼びたくない",
      "title_romanji":
          "Shirogane Miyuki wa Miagetai / Dai 67 Ki Seitokai / Kaguya-sama wa Yobitakunai ",
      "aired": "2020-04-25T00:00:00+00:00",
      "filler": false,
      "recap": false,
      "video_url": null,
      "forum_url": "https://myanimelist.net/forum/?topicid=1836810"
    },
    {
      "episode_id": 4,
      "title":
          "Ai Hayasaka Wants Him to Fall for Her / Kaguya Wants to Be Confessed To / Miko Iino Wants to Set Things Right",
      "title_japanese": "早坂愛はオトしたい / かぐや様は告ら“れ”たい / 伊井野ミコは正したい",
      "title_romanji":
          "Hayasaka Ai wa Oto Shitai / Kaguya-sama wa Kokura\"re\"tai / Iino Miko wa Tadashitai ",
      "aired": "2020-05-02T00:00:00+00:00",
      "filler": false,
      "recap": false,
      "video_url": null,
      "forum_url": "https://myanimelist.net/forum/?topicid=1838148"
    },
    {
      "episode_id": 5,
      "title":
          "Miyuki Shirogane Wants Girls to Fall for Him / Nagisa Kashiwagi Wants to Console / Miyuki Shirogane Wants to Sing / Kaguya Wants to Kick Them Down",
      "title_japanese": "白銀御行はモテたい / 柏木渚は慰めたい / 白銀御行は歌いたい / かぐや様は蹴落としたい",
      "title_romanji":
          "Shirogane Miyuki wa Motetai / Kashiwagi Nagisa wa Nagusametai / Shirogane Miyuki wa Utaitai / Kaguya-sama wa Keotoshitai ",
      "aired": "2020-05-09T00:00:00+00:00",
      "filler": false,
      "recap": false,
      "video_url": null,
      "forum_url": "https://myanimelist.net/forum/?topicid=1838304"
    },
    {
      "episode_id": 6,
      "title":
          "I Don't Want to Make Miko Iino Smile / I Want to Make Miko Iino Smile / Kaguya Isn't Getting Called",
      "title_japanese": "伊井野ミコを笑わせない / 伊井野ミコを笑わせたい / かぐや様は呼ばれない",
      "title_romanji":
          "Iino Miko wo Warasenai / Iino Miko wo Warasetai / Kaguya-sama wa Yobarenai ",
      "aired": "2020-05-16T00:00:00+00:00",
      "filler": false,
      "recap": false,
      "video_url": null,
      "forum_url": "https://myanimelist.net/forum/?topicid=1840938"
    },
    {
      "episode_id": 8,
      "title":
          "Miko Iino Wants to Control Herself / Kaguya Doesn't Scare Easily / Kaguya Wants to Be Examined",
      "title_japanese": "伊井野ミコは抑えたい / かぐや様は怯えない / かぐや様は診られたい",
      "title_romanji":
          "Iino Miko wa Osaetai / Kaguya-sama wa Obienai / Kaguya-sama wa Miraretai ",
      "aired": "2020-05-30T00:00:00+00:00",
      "filler": false,
      "recap": false,
      "video_url": null,
      "forum_url": "https://myanimelist.net/forum/?topicid=1843523"
    }
  ]
};
