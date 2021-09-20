import 'package:flutter/material.dart';
import 'package:kos_app/string.dart';

class FacilityItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String total;

  FacilityItem({
    required this.name,
    required this.imageUrl,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageUrl,
          width: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
            text: '$name :',
            style: greyTextStyle.copyWith(fontSize: 14),
            children: [
              TextSpan(
                text: ' $total',
                style: blackTextStyle.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
