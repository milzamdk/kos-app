import 'package:flutter/material.dart';
import 'package:kos_app/color.dart';
import 'package:kos_app/model/kos.dart';
import 'package:kos_app/pages/detail_kos_page.dart';
import 'package:kos_app/string.dart';

class KosCard extends StatelessWidget {
  final Kos kos;

  KosCard(this.kos);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailKosPage(kos),
          ),
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 130,
              height: 110,
              child: Stack(
                children: [
                  Image.network(
                    kos.imageUrl,
                    width: 130,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(22),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon_star.png',
                            width: 22,
                            height: 22,
                          ),
                          Text(
                            '${kos.rating}/5',
                            style: whiteTextStyle.copyWith(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                kos.nama,
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text.rich(
                TextSpan(
                  text: '\$${kos.harga}',
                  style: blueTextStyle.copyWith(fontSize: 16),
                  children: [
                    TextSpan(
                      text: ' / month',
                      style: greyTextStyle.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                '${kos.kecamatan}, ${kos.kabupaten}',
                style: greyTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
