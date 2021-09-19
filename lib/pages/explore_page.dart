import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExplorePage extends StatelessWidget {
  final VoidCallback openDrawer;

  const ExplorePage({
    Key? key,
    required this.openDrawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: openDrawer,
          icon: FaIcon(FontAwesomeIcons.bars),
          color: Color(0XFF040507),
          disabledColor: Color(0XFF040507),
        ),
        actions: [],
      ),
      body: Text('Haloo'),
    );
  }
}
