class ImageLinks {
  String? smallThumbnail;
  String thumbnail;

  ImageLinks({
    this.smallThumbnail,
    required this.thumbnail,});

  factory ImageLinks.fromJson(Map<String  , dynamic > json) {
    return ImageLinks(thumbnail: json['thumbnail']);
    // smallThumbnail = json['smallThumbnail'];
    // thumbnail = json['thumbnail'];
  }


  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['smallThumbnail'] = smallThumbnail;
  //   map['thumbnail'] = thumbnail;
  //   return map;
  // }

}
