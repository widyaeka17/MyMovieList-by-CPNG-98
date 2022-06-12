import 'package:flutter/material.dart';

class DetailMovie extends StatefulWidget {
  const DetailMovie({Key? key}) : super(key: key);

  @override
  State<DetailMovie> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  bool isMovie = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(
                    'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2021/12/08/1244609186.jpg'),
              ],
            ),
            Card(
              child: Container(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 16.0, left: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Spiderman',
                            style: TextStyle(
                              fontSize: 30.0,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              isMovie ? Icons.movie : Icons.movie_creation_outlined,
                              color: Colors.redAccent,
                            ),
                            onPressed: () {
                              setState(() {
                                isMovie = !isMovie;
                              });
                              },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(height: 8),
                              Text(
                                'Petualang, Fantasi'
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              SizedBox(
                                  height: 8),
                              Text(
                                '9/9/2022'
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              SizedBox(height: 8),
                              Text(
                                  '2 h'
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 8),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'sinopsis dksda kdk is joidjaijd iaj aoisjaklfjk hj oi haoihoai hoai hoai hoai h ao oisah oia hfiohsaoi hfoisa hfois haoifh soa ois ahfoisa hf s sois ahifh saoifh s aa aoi',
                        style: const TextStyle(
                          fontSize: 16.0
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
