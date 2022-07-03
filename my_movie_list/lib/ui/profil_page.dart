import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_list/ui/login_page.dart';
import 'package:my_movie_list/ui/setting_page.dart';
import 'package:my_movie_list/ui/watchlist_page.dart';

import '../common/styles.dart';

class ProfilPage extends StatefulWidget {
  static const routeName = '/profil-page';
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(80.0),
                        bottomRight: Radius.circular(80.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://images.pexels.com/photos/4065876/pexels-photo-4065876.jpeg',
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const SizedBox(height: 16),
                    StreamBuilder<User?>(
                        stream: FirebaseAuth.instance.userChanges(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              '${snapshot.data?.email}',
                              style: heading5,
                            );
                          } else {
                            return Text(
                              'DummyAccount',
                              style: heading5,
                            );
                          }
                        }),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, WatchlistPage.routeName);
                        },
                        child: const ListProfil(
                            iconList: Icons.slow_motion_video_outlined,
                            textList: 'Watchlist')),
                    const Divider(
                      height: 35,
                      thickness: 2,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, SettingsPage.routeName);
                        },
                        child: const ListProfil(
                            iconList: Icons.settings, textList: 'Setting')),
                    const Divider(
                      height: 35,
                      thickness: 2,
                    ),
                    InkWell(
                        onTap: () async {
                          _isLoading = true;
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context)
                              .pushReplacementNamed(LoginPage.routeName);
                          _isLoading = false;
                        },
                        child: const ListProfil(
                            iconList: Icons.logout, textList: 'Logout')),
                    const Divider(
                      height: 35,
                      thickness: 2,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}

class ListProfil extends StatelessWidget {
  final IconData iconList;
  final String textList;
  const ListProfil({Key? key, required this.iconList, required this.textList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          iconList,
          size: 24,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Text(
            textList,
            style: subtitle,
          ),
        ),
      ],
    );
  }
}
