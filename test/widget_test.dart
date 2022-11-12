import 'dart:convert';

import 'package:al_quran_app/App/data/models/ayat.dart';
import 'package:al_quran_app/App/data/models/surah.dart';
import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse("https://api.quran.gading.dev/surah/108/1");
  var response = await http.get(url);

  Map<String, dynamic> data = json.decode(response.body)["data"];

  Map<String, dynamic> dataModel = {
    "number": data['number'],
    "meta": data['meta'],
    "text": data['text'],
    "translation": data['translation'],
    "audio": data['audio'],
    "tafsir": data['tafsir']
  };

  Ayat ayat = Ayat.fromJson(dataModel);

  print(ayat.tafsir?.id?.short);
}
