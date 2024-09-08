class Epub {
  bool? isAvailable;

  Epub({
    this.isAvailable,});

  Epub.fromJson(dynamic json) {
    isAvailable = json['isAvailable'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isAvailable'] = isAvailable;
    return map;
  }

}
