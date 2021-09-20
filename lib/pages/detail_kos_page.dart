import 'package:flutter/material.dart';
import 'package:kos_app/color.dart';
import 'package:kos_app/model/kos.dart';
import 'package:kos_app/pages/error_page.dart';
import 'package:kos_app/string.dart';
import 'package:kos_app/widget/facility_item.dart';
import 'package:kos_app/widget/rating_item.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailKosPage extends StatefulWidget {
  final Kos kos;
  DetailKosPage(this.kos);

  @override
  _DetailKosPageState createState() => _DetailKosPageState();
}

class _DetailKosPageState extends State<DetailKosPage> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        //! throw (url);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }

    Future<void> showDialogConfirm() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Konfirmasi'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Apakah kamu ingin menghubungi pemilik kos?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Batal'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Mau'),
                onPressed: () {
                  Navigator.of(context).pop();
                  launchUrl('tel:${widget.kos.telp}');
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: basicWhiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              widget.kos.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: basicWhiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      //* TITLE
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.kos.nama,
                                  style: blackTextStyle.copyWith(fontSize: 22),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: 'Rp ${widget.kos.harga}',
                                    style:
                                        blackTextStyle.copyWith(fontSize: 16),
                                    children: [
                                      TextSpan(
                                        text: ' / month',
                                        style: greyTextStyle.copyWith(
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                1,
                                2,
                                3,
                                4,
                                5,
                              ].map((index) {
                                return Container(
                                  child: RatingItem(
                                    index: index,
                                    rating: widget.kos.rating,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //* FASILITAS UTAMA
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          'Fasilitas Utama',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                FacilityItem(
                                  imageUrl: 'assets/icon_bathroom.png',
                                  total: '${widget.kos.kamarmandi}',
                                  name: 'kamar mandi',
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                FacilityItem(
                                  imageUrl: 'assets/icon_bedroom.png',
                                  total: '${widget.kos.tempattidur}',
                                  name: 'tempat tidur',
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                FacilityItem(
                                  imageUrl: 'assets/ic_cupboard.png',
                                  total: '${widget.kos.lemari}',
                                  name: 'lemari',
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                FacilityItem(
                                  imageUrl: 'assets/ic_cupboard.png',
                                  total: '${widget.kos.mejakursi}',
                                  name: 'lemari',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //* FOTO
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          'Foto-foto',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: widget.kos.photos.map((item) {
                            return Container(
                              margin: EdgeInsets.only(
                                left: 24,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  item,
                                  width: 110,
                                  height: 88,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //* LOKASI
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          'Lokasi',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.kos.alamat}\n${widget.kos.kecamatan}',
                              style: greyTextStyle,
                            ),
                            InkWell(
                              onTap: () {
                                // launchUrl(
                                //   'https://goo.gl/maps/vNGKc4AMKtapw7js5',
                                // );

                                launchUrl(widget.kos.mapUrl);
                              },
                              child: Image.asset(
                                'assets/btn_map.png',
                                width: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        width: MediaQuery.of(context).size.width - (2 * 24),
                        height: 50,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: blueColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                          ),
                          onPressed: () {
                            showDialogConfirm();
                          },
                          child: Text(
                            'Pesan Sekarang',
                            style: whiteTextStyle.copyWith(fontSize: 18),
                          ),
                          // onPressed: () {
                          //   launchUrl('tel:${widget.kos.telpon}');
                          // },

                          // Text(
                          //   'Pesan Sekarang',
                          //   style: whiteTextStyle.copyWith(fontSize: 18),
                          // ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 24,
                left: 30,
                right: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isActive = !isActive;
                      });
                    },
                    child: Image.asset(
                      isActive
                          ? 'assets/btn_wishlist_active.png'
                          : 'assets/btn_wishlist.png',
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
