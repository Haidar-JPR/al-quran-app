import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../../data/models/detail_surah.dart';

class DetailSurahC extends GetxController {
  Future<DetailSurah> getDetailSurah(String id) async {
    Uri url = Uri.parse("https://api.quran.gading.dev/surah/$id");
    var response = await http.get(url);

    Map<String, dynamic> data =
        (json.decode(response.body) as Map<String, dynamic>)["data"];

    return DetailSurah.fromJson(data);
  }
}
