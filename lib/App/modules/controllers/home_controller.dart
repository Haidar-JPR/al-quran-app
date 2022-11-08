import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../data/models/surah.dart';

class HomeController extends GetxController {
  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse("https://api.quran.gading.dev/surah");
    var response = await http.get(url);

    List? data = (json.decode(response.body) as Map<String, dynamic>)["data"];

    //NOTE: karena masih dynamic maka perlu diubah ke dalam bentuk json dengan cara dilakukan mapping
    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Surah.fromJson(e)).toList();
    }
  }
}
