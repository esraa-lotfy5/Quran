import 'package:quran/features/quran/data_layer/models/ayah_model.dart';

class Surah {
  final int number;
  final String name;
  final List<Ayah> ayahs;

  Surah({required this.number, required this.name, required this.ayahs});

  factory Surah.fromJson(Map<String, dynamic> json) {
    var ayahList = json['ayahs'] as List;

    return Surah(number: json['number'], name: json['name'], ayahs: ayahList.map((e) => Ayah.fromJson(e)).toList());
  }
}
