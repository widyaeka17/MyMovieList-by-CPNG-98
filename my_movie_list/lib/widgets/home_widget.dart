import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_list/widgets/platform_widget.dart';
import 'package:provider/provider.dart';

import '../ui/detail_page.dart';
import '../ui/search_page.dart';
import '../utils/result_state.dart';
import '../provider/in_theaters_provider.dart';
import '../provider/popular_provider.dart';
import '../provider/upcoming_provider.dart';
import '../ui/in_theaters_list.dart';
import '../ui/popular_list.dart';
import '../ui/upcoming_list.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  Widget _buildList(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.only(right: 20.0, left: 20, top: 20),
            child: Column(children: [
              Consumer<PopularProvider>(
                builder: (context, state, _) {
                  if (state.state == ResultState.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.state == ResultState.hasData) {
                    List<Widget> imageSliders = state.result.items
                        .map((item) => InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, MovieItemsDetailPage.routeName,
                                  arguments: item);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0)),
                                  child: Stack(
                                    children: <Widget>[
                                      Image.network(item.image!,
                                          fit: BoxFit.cover, width: 1000.0),
                                      Positioned(
                                        bottom: 0.0,
                                        left: 0.0,
                                        right: 0.0,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color.fromARGB(200, 0, 0, 0),
                                                Color.fromARGB(0, 0, 0, 0)
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 20.0),
                                          child: Text(
                                            item.title,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            )))
                        .toList();
                    return CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                      ),
                      items: imageSliders,
                    );
                  } else if (state.state == ResultState.noData) {
                    return Center(child: Text(state.message));
                  } else if (state.state == ResultState.error) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: Text(''));
                  }
                },
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Coming Soon",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, UpcomingListPage.routeName);
                      },
                      child: const Text("See more",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                alignment: const Alignment(-1.0, 0.0),
              ),
              Consumer<UpcomingProvider>(
                builder: (context, state, _) {
                  if (state.state == ResultState.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.state == ResultState.hasData) {
                    return Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: (MediaQuery.of(context).size.height * 0.20),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.result.items.length < 5
                              ? state.result.items.length
                              : 5,
                          itemBuilder: (context, index) {
                            var data = state.result.items[index];
                            var img = data.image ?? 'https://cdn.pixabay.com/photo/2012/08/27/22/59/movie-projector-55122__340.png';
                            return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, MovieItemsDetailPage.routeName,
                                      arguments: data);
                                },
                                child: SizedBox(
                                  width: 100,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 10, right: 10),
                                    padding: const EdgeInsets.only(
                                        bottom: 10, right: 10, left: 10),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(img
                                            .replaceAll('original', '384x528')),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, 0),
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                    alignment: Alignment.bottomLeft,
                                    child: Text(data.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                              Shadow(
                                                  color: Colors.black
                                                      .withOpacity(1),
                                                  offset: const Offset(0, 0),
                                                  blurRadius: 10),
                                            ])),
                                  ),
                                ));
                          }),
                    );
                  } else if (state.state == ResultState.noData) {
                    return Center(child: Text(state.message));
                  } else if (state.state == ResultState.error) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: Text(''));
                  }
                },
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Popular",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, PopularListPage.routeName);
                      },
                      child: const Text("See more",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                alignment: const Alignment(-1.0, 0.0),
              ),
              Consumer<PopularProvider>(
                builder: (context, state, _) {
                  if (state.state == ResultState.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.state == ResultState.hasData) {
                    return Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: (MediaQuery.of(context).size.height * 0.20),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.result.items.length < 5
                              ? state.result.items.length
                              : 5,
                          itemBuilder: (context, index) {
                            var data = state.result.items[index];
                            return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, MovieItemsDetailPage.routeName,
                                      arguments: data);
                                },
                                child: SizedBox(
                                  width: 100,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 10, right: 10),
                                    padding: const EdgeInsets.only(
                                        bottom: 10, right: 10, left: 10),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(data.image!
                                            .replaceAll('original', '384x528')),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, 0),
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                    alignment: Alignment.bottomLeft,
                                    child: Text(data.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                              Shadow(
                                                  color: Colors.black
                                                      .withOpacity(1),
                                                  offset: const Offset(0, 0),
                                                  blurRadius: 10),
                                            ])),
                                  ),
                                ));
                          }),
                    );
                  } else if (state.state == ResultState.noData) {
                    return Center(child: Text(state.message));
                  } else if (state.state == ResultState.error) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: Text(''));
                  }
                },
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("In Theater",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, InTheatersListPage.routeName);
                      },
                      child: const Text("See more",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                alignment: const Alignment(-1.0, 0.0),
              ),
              Consumer<InTheatersProvider>(
                builder: (context, state, _) {
                  if (state.state == ResultState.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.state == ResultState.hasData) {
                    return Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: (MediaQuery.of(context).size.height * 0.20),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.result.items.length < 5
                              ? state.result.items.length
                              : 5,
                          itemBuilder: (context, index) {
                            var data = state.result.items[index];
                            return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, MovieItemsDetailPage.routeName,
                                      arguments: data);
                                },
                                child: SizedBox(
                                  width: 100,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 10, right: 10),
                                    padding: const EdgeInsets.only(
                                        bottom: 10, right: 10, left: 10),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(data.image!
                                            .replaceAll('original', '384x528')),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, 0),
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                    alignment: Alignment.bottomLeft,
                                    child: Text(data.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                              Shadow(
                                                  color: Colors.black
                                                      .withOpacity(1),
                                                  offset: const Offset(0, 0),
                                                  blurRadius: 10),
                                            ])),
                                  ),
                                ));
                          }),
                    );
                  } else if (state.state == ResultState.noData) {
                    return Center(child: Text(state.message));
                  } else if (state.state == ResultState.error) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: Text(''));
                  }
                },
              ),
            ])));
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Movie List'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, MovieSearchPage.routeName);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('My Movie List'),
        trailing: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, MovieSearchPage.routeName);
          },
          child: const Icon(
            CupertinoIcons.search,
          ),
        ),
      ),
      child: _buildList(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
