import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ApiData/provider_module.dart';
import 'ApiData/restaurant_list.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ListProvider().getHomeData(),
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text('My Movie List'),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(right: 20.0, left: 20, top: 20),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://i.pinimg.com/564x/23/a0/2d/23a02d65c88c65377b10d399cec5dee6.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 0),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child:Text("Comming Soon",
                        style: TextStyle(fontSize: 20,color: Colors.blue, fontWeight: FontWeight.bold)
                    ),
                    alignment: Alignment(-1.0, 0.0),
                  ),
                  Consumer<ListProvider>(
                    builder: (context, state, _) {
                      if (state.state == ResultState.Loading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state.state == ResultState.HasData) {
                        List<Item> dataset = state.listdataCommingSoon.items;
                        return Container(
                          margin: const EdgeInsets.only( top: 5),
                          height: (MediaQuery.of(context).size.height * 0.20),
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: dataset.map((data) {
                                return SizedBox(
                                  width: 100,
                                  child: Container(
                                    margin: const EdgeInsets.only( bottom: 10, right: 10),
                                    padding: const EdgeInsets.only( bottom: 10, right: 10,left: 10),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(data.image.replaceAll('original', '384x528')),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
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
                                                  color: Colors.black.withOpacity(1),
                                                  offset: const Offset(0, 0),
                                                  blurRadius: 10),
                                            ]
                                        )
                                    ),
                                  ),
                                );
                              }).toList()),
                        );
                      } else if (state.state == ResultState.NoData) {
                        return Center(child: Text(state.message));
                      } else if (state.state == ResultState.Error) {
                        return Center(child: Text(state.message));
                      } else {
                        return Center(
                          child: Text('No data to displayed'),
                        );
                      }
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child:Text("Popular",
                        style: TextStyle(fontSize: 20,color: Colors.blue, fontWeight: FontWeight.bold)
                    ),
                    alignment: Alignment(-1.0, 0.0),
                  ),
                  Consumer<ListProvider>(
                    builder: (context, state, _) {
                      if (state.state == ResultState.Loading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state.state == ResultState.HasData) {
                        List<Item> dataset = state.listdataPopular.items;
                        return Container(
                          margin: const EdgeInsets.only( top: 5),
                          height: (MediaQuery.of(context).size.height * 0.20),
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: dataset.map((data) {
                                return SizedBox(
                                  width: 100,
                                  child: Container(
                                    margin: const EdgeInsets.only( bottom: 10, right: 10),
                                    padding: const EdgeInsets.only( bottom: 10, right: 10,left: 10),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(data.image.replaceAll('original', '384x528')),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
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
                                                  color: Colors.black.withOpacity(1),
                                                  offset: const Offset(0, 0),
                                                  blurRadius: 10),
                                            ]
                                        )
                                    ),
                                  ),
                                );
                              }).toList()),
                        );
                      } else if (state.state == ResultState.NoData) {
                        return Center(child: Text(state.message));
                      } else if (state.state == ResultState.Error) {
                        return Center(child: Text(state.message));
                      } else {
                        return Center(
                          child: Text('No data to displayed'),
                        );
                      }
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child:Text("In Theater",
                        style: TextStyle(fontSize: 20,color: Colors.blue, fontWeight: FontWeight.bold)
                    ),
                    alignment: Alignment(-1.0, 0.0),
                  ),
                  Consumer<ListProvider>(
                    builder: (context, state, _) {
                      if (state.state == ResultState.Loading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state.state == ResultState.HasData) {
                        List<Item> dataset = state.listDataTeater.items;
                        return Container(
                          margin: const EdgeInsets.only( top: 5),
                          height: (MediaQuery.of(context).size.height * 0.20),
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: dataset.map((data) {
                                return SizedBox(
                                  width: 100,
                                  child: Container(
                                    margin: const EdgeInsets.only( bottom: 10, right: 10),
                                    padding: const EdgeInsets.only( bottom: 10, right: 10,left: 10),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(data.image.replaceAll('original', '384x528')),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
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
                                                  color: Colors.black.withOpacity(1),
                                                  offset: const Offset(0, 0),
                                                  blurRadius: 10),
                                            ]
                                        )
                                    ),
                                  ),
                                );
                              }).toList()),
                        );
                      } else if (state.state == ResultState.NoData) {
                        return Center(child: Text(state.message));
                      } else if (state.state == ResultState.Error) {
                        return Center(child: Text(state.message));
                      } else {
                        return Center(
                          child: Text('No data to displayed'),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}