import 'package:capitals_app/moduls/words.dart';

class Words {
  int? id;
  String? name;
  String? iso3;
  String? iso2;
  String? numeric_code;
  String? phone_code;
  String? capital;
  String? currency;
  String? currency_name;
  String? currency_symbol;
  String? tld;
  String? native;
  String? region;
  String? subregion;
  String? latitude;
  String? longitude;
  String? emoji;
  String? emojiU;

  Words(
    this.name,
    this.iso3,
    this.iso2,
    this.numeric_code,
    this.phone_code,
    this.capital,
    this.currency,
    this.currency_name,
    this.currency_symbol,
    this.tld,
    this.native,
    this.region,
    this.subregion,
    this.latitude,
    this.longitude,
    this.emoji,
    this.emojiU,
  );

  Words.withId(
    this.id,
    this.name,
    this.iso3,
    this.iso2,
    this.numeric_code,
    this.phone_code,
    this.capital,
    this.currency,
    this.currency_name,
    this.currency_symbol,
    this.tld,
    this.native,
    this.region,
    this.subregion,
    this.latitude,
    this.longitude,
    this.emoji,
    this.emojiU,
  );

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      "name": name,
      "iso3": iso3,
      "iso2": iso2,
      "numeric_code": numeric_code,
      "phone_code": phone_code,
      "capital": capital,
      "currency": currency,
      "currency_name": currency_name,
      "currency_symbol": currency_symbol,
      "tld": tld,
      "native": native,
      "region": region,
      "subregion": subregion,
      "latitude": latitude,
      "longitude": longitude,
      "emoji": emoji,
      "emojiU": emojiU,
    };
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  Words.fromMap(Map<String, Object?> map) {
    id = (map["id"] as int?)!;
    name = (map["name"] as String?)!;
    iso3 = (map["iso3"] as String?)!;
    iso2 = (map["iso2"] as String?)!;
    numeric_code = (map["numeric_code"] as String?)!;
    phone_code = (map["phone_code"] as String?)!;
    capital = (map["capital"] as String?)!;
    currency = (map["currency"] as String?)!;
    currency_name = (map["currency_name"] as String?)!;
    tld = (map["tld"] as String?)!;
    native = (map["native"].toString());
    region = (map["region"] as String?)!;
    subregion = (map["subregion"] as String?)!;
    latitude = (map["latitude"] as String?)!;
    longitude = (map["longitude"] as String?)!;
    emoji = (map["emoji"] as String?)!;
    emojiU = (map["emojiU"] as String?)!;
  }

  Words.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    name = json['name'];
    iso3 = json['iso3'];
    iso2 = json['iso2'];
    numeric_code = json['numeric_code'];
    phone_code = json['phone_code'];
    capital = json['capital'];
    currency = json['currency'];
    currency_name = json['currency_name'];
    tld = json['tld'];
    native = json['native'];
    region = json['region'];
    subregion = json['subregion'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    native = json['native'];
    emoji = json['emoji'];
    emojiU = json['emojiU'];
  }

// static List<Words> myWordss = [
//   Words("task 1", "desc 1", DateTime(1, 1, 1)),
//   Words("task 2", "desc 2", DateTime(1, 1, 1)),
//   Words("task 3", "desc 3", DateTime(1, 1, 1)),
//   Words("task 4", "desc 4", DateTime(1, 1, 1)),
//   Words("task 5", "desc 5", DateTime(1, 1, 1)),
// ];
}
