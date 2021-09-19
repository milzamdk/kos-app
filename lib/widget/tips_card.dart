import 'package:flutter/material.dart';
import 'package:kos_app/color.dart';
import 'package:kos_app/model/tips.dart';
import 'package:kos_app/string.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;

  TipsCard(this.tips);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imageUrl,
          width: 80,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.name,
              style: blackTextStyle.copyWith(fontSize: 18),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Terupdate pada ${tips.updated}',
              style: greyTextStyle,
            ),
          ],
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
    );
  }
}
