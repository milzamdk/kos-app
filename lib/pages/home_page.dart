import 'package:flutter/material.dart';
import 'package:kos_app/color.dart';
import 'package:kos_app/model/kos.dart';
import 'package:kos_app/model/location.dart';
import 'package:kos_app/model/tips.dart';
import 'package:kos_app/providers/kos_provider.dart';
import 'package:kos_app/string.dart';
import 'package:kos_app/widget/bottom_navbar_item.dart';
import 'package:kos_app/widget/kos_card.dart';
import 'package:kos_app/widget/location_card.dart';
import 'package:kos_app/widget/tips_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Kos> kos = [];
  @override
  Widget build(BuildContext context) {
    var kosProvider = Provider.of<KosProvider>(context);
    kosProvider.getRecommendedKos();

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          //* TITLE/HEADER
          children: [
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: Text(
                'Jelajahi Sekarang',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Mencari kos-kosan yang nyaman',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //* LOKASI POPULER
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Lokasi Populer',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  LocationCard(
                    Location(
                      id: 1,
                      name: 'Sragen',
                      imageUrl: 'assets/city1.png',
                      isPopuler: true,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  LocationCard(
                    Location(
                      id: 2,
                      name: 'Masaran',
                      imageUrl: 'assets/city2.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  LocationCard(
                    Location(
                      id: 3,
                      name: 'Karangmalang',
                      imageUrl: 'assets/city3.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  LocationCard(
                    Location(
                      id: 4,
                      name: 'Kedawung',
                      imageUrl: 'assets/city4.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  LocationCard(
                    Location(
                      id: 5,
                      name: 'Gemolong',
                      imageUrl: 'assets/city5.png',
                      isPopuler: true,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  LocationCard(
                    Location(
                      id: 6,
                      name: 'Plupuh',
                      imageUrl: 'assets/city6.png',
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //* REKOMENDASI
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'List Kos',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: FutureBuilder(
                future: kosProvider.getRecommendedKos(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    kos = snapshot.data;

                    int index = 0;

                    return Column(
                        children: kos.map((item) {
                      index++;
                      return Container(
                        margin: EdgeInsets.only(
                          top: index == 1 ? 0 : 20,
                        ),
                        child: KosCard(item),
                      );
                    }).toList());
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //* TIPS & GUIDANCE
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Tips & Panduan',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  TipsCard(
                    Tips(
                      id: 1,
                      name: 'Panduan Tempat',
                      imageUrl: 'assets/tips1.png',
                      updated: '20 Juli',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(
                    Tips(
                      id: 2,
                      name: 'Fairship',
                      imageUrl: 'assets/tips2.png',
                      updated: '1 Juli',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/tips2.png',
                          width: 80,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Upload Data',
                          style: blackTextStyle.copyWith(fontSize: 18),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.chevron_right,
                            color: greyColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 65 + 24,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * 24),
        margin: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/icon_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_email.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
