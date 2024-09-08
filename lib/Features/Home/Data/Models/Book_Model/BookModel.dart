import 'package:bookly_app/Features/Home/Data/Models/Book_Model/AccessInfo.dart';
import 'package:bookly_app/Features/Home/Data/Models/Book_Model/SaleInfo.dart';
import 'package:bookly_app/Features/Home/Data/Models/Book_Model/SearchInfo.dart';
import 'package:bookly_app/Features/Home/Data/Models/Book_Model/VolumeInfo.dart';

class BookModel {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;
  
  BookModel({
      this.kind,
      this.id,
      this.etag,
      this.selfLink,
      required this.volumeInfo,
      this.saleInfo,
      this.accessInfo,
      this.searchInfo,
  });

  factory BookModel.fromJson(Map<String , dynamic> json) {
    return BookModel(volumeInfo: VolumeInfo.fromJson(json['volumeInfo']));
    // kind = json['kind'];
    // id = json['id'];
    // etag = json['etag'];
    // selfLink = json['selfLink'];
    // volumeInfo = json['volumeInfo'] != null ? VolumeInfo.fromJson(json['volumeInfo']) : null;
    // saleInfo = json['saleInfo'] != null ? SaleInfo.fromJson(json['saleInfo']) : null;
    // accessInfo = json['accessInfo'] != null ? AccessInfo.fromJson(json['accessInfo']) : null;
    // searchInfo = json['searchInfo'] != null ? SearchInfo.fromJson(json['searchInfo']) : null;
  }
 

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['kind'] = kind;
  //   map['id'] = id;
  //   map['etag'] = etag;
  //   map['selfLink'] = selfLink;
  //   if (volumeInfo != null) {
  //     map['volumeInfo'] = volumeInfo?.toJson();
  //   }
  //   if (saleInfo != null) {
  //     map['saleInfo'] = saleInfo?.toJson();
  //   }
  //   if (accessInfo != null) {
  //     map['accessInfo'] = accessInfo?.toJson();
  //   }
  //   if (searchInfo != null) {
  //     map['searchInfo'] = searchInfo?.toJson();
  //   }
  //   return map;
  // }

}