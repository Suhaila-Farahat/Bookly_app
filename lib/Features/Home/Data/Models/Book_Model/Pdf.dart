class Pdf {
  bool? isAvailable;

  Pdf({
    this.isAvailable,});

  Pdf.fromJson(dynamic json) {
    isAvailable = json['isAvailable'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isAvailable'] = isAvailable;
    return map;
  }

}
