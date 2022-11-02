// import 'dart:convert';

// import 'package:al_quran_app/App/data/models/surah.dart';
// import 'package:http/http.dart' as http;

// void main() async {
//   Uri url = Uri.parse("https://api.quran.gading.dev/surah");
//   var response = await http.get(url);

//   // Diubah ke tipe object
//   // print(response.body);

//   List data = (json.decode(response.body) as Map<String, dynamic>)["data"];

//   // print(data[113]);

//   // Data raw dari API -> dimasukkan ke Model Surah
//   Surah dataSurah = Surah.fromJson(data[113]);

//   print(dataSurah.toJson());
// }
