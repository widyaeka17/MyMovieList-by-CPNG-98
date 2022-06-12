import 'package:capstone/detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wachlist extends StatefulWidget {
  const Wachlist({Key? key}) : super(key: key);

  @override
  State<Wachlist> createState() => _WachlistState();
}

class _WachlistState extends State<Wachlist> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.keyboard_backspace),
        title: Text('Wachlist'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child : InkWell(
          child : Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Image.network(
                    'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2021/12/08/1244609186.jpg',
                    width: 100,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            'Spiderman',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  SizedBox(height: 4),
                                  Text(
                                      'Petualang, Fantasi'
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                      height: 0),
                                  Text(
                                      '9/9/2022'
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(height: 0),
                                  Text(
                                      '2 h'
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Inbox',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}