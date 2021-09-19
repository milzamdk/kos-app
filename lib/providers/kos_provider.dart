import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kos_app/model/kos.dart';

class KosProvider extends ChangeNotifier {
  getRecommendedKos() async {
    var result = await http
        .get(Uri.parse('http://bwa-cozy.herokuapp.com/recommended-spaces'));
    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Kos> kos = data.map((item) => Kos.fromJson(item)).toList();
      return kos;
    } else {
      return <Kos>[];
    }
  }
}
