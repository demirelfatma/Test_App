class VibrationModel {
  int? id;
  double? x;
  double? y;
  double? z;
  DateTime? dateTime; // Yeni eklenen alan

  VibrationModel({this.id, this.x, this.y, this.z, this.dateTime});

  VibrationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    x = json['X'];
    y = json['Y'];
    z = json['Z'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['X'] = x;
    data['Y'] = y;
    data['Z'] = z;
    data['DateTime'] = dateTime?.toIso8601String(); // DateTime'i JSON'a dönüştürme
    return data;
  }
}
