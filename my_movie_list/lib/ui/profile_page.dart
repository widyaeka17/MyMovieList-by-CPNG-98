import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_list/ui/setting_page.dart';

import '../common/styles.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.blue.shade100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'DummyAccount',
                    style: heading5,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'dummy@gmail.com',
                    style: subtitle,
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    child: CachedNetworkImage(
                      imageUrl:
                      'https://cdn.pixabay.com/photo/2020/05/06/12/32/binary-5137349_960_720.jpg',
                      width: 110,
                      height: 110,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
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
                      onTap: () {},
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
                      onTap: () {},
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
