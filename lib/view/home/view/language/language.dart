import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends Translations {
  static const defaultv = Locale("tr","TR");
  static const languages = [Locale("tr","TR"),Locale("en","US")];
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'Kaydı Başlat': 'Start Recording',
          'Tabloyu Temizle': 'Clear Table',
          'Kaydı Durdur' : 'Stop Recording',
          'Titreşim Analizi' : 'Vibration Analysis',
          'Çıkış': 'Exit'
        },
        'tr_TR': {
          'Kaydı Başlat': 'Kaydı Başlat',
          'Tabloyu Temizle': 'Tabloyu Temizle',
          'Kaydı Durdur' : 'Kaydı Durdur',
          'Titreşim Analizi' : 'Titreşim Analizi',
          'Çıkış': 'Çıkış'
        }
      };

}