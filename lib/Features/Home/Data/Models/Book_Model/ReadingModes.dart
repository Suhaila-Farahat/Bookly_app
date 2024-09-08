class ReadingModes {
  bool? text;
  bool? image;

  ReadingModes({
    this.text,
    this.image,});

  ReadingModes.fromJson(dynamic json) {
    text = json['text'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['image'] = image;
    return map;
  }

}
