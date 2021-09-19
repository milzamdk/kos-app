import 'package:flutter/material.dart';
import 'package:kos_app/color.dart';
import 'package:kos_app/model/location.dart';
import 'package:kos_app/string.dart';

class LocationCard extends StatelessWidget {
  final Location location;

  LocationCard(this.location);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: backgroundCardColor,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  location.imageUrl,
                  width: 120,
                  height: 102,
                  fit: BoxFit.cover,
                ),
                location.isPopuler
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/icon_star.png',
                              width: 22,
                              height: 22,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              location.name,
              style: blackTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
