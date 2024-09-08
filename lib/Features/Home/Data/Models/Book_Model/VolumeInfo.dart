import 'package:bookly_app/Features/Home/Data/Models/Book_Model/ImageLinks.dart';
import 'package:bookly_app/Features/Home/Data/Models/Book_Model/IndustryIdentifiers.dart';
import 'package:bookly_app/Features/Home/Data/Models/Book_Model/PanelizationSummary.dart';
import 'package:bookly_app/Features/Home/Data/Models/Book_Model/ReadingModes.dart';

class VolumeInfo {
  String? title;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  List<IndustryIdentifiers>? industryIdentifiers;
  ReadingModes? readingModes;
  int? pageCount;
  String? printType;
  List<String>? categories;
  dynamic averageRating;
  int? ratingsCount;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;

  VolumeInfo({
    required this.title,
    required this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    required this.categories,
    required this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    required this.imageLinks,
    this.language,
    required this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,});

  factory VolumeInfo.fromJson(Map<String , dynamic> json) {
    return VolumeInfo(
        imageLinks: json['imageLinks'] == null ? null : ImageLinks.fromJson(json['imageLinks']),
        title: json['title'],
        authors: json['authors'].cast<String>(),
        averageRating: json['averageRating'],
        categories: json['categories'] != null ? json['categories'].cast<String>() : [],
        previewLink: json['previewLink'],
    );
  }
  //   title = json['title'];
  //   authors = json['authors'] != null ? json['authors'].cast<String>() : [];
  //   publisher = json['publisher'];
  //   publishedDate = json['publishedDate'];
  //   description = json['description'];
  //   if (json['industryIdentifiers'] != null) {
  //     industryIdentifiers = [];
  //     json['industryIdentifiers'].forEach((v) {
  //       industryIdentifiers?.add(IndustryIdentifiers.fromJson(v));
  //     });
  //   }
  //   readingModes = json['readingModes'] != null ? ReadingModes.fromJson(json['readingModes']) : null;
  //   pageCount = json['pageCount'];
  //   printType = json['printType'];
  //   categories = json['categories'] != null ? json['categories'].cast<String>() : [];
  //   averageRating = json['averageRating'];
  //   ratingsCount = json['ratingsCount'];
  //   maturityRating = json['maturityRating'];
  //   allowAnonLogging = json['allowAnonLogging'];
  //   contentVersion = json['contentVersion'];
  //   panelizationSummary = json['panelizationSummary'] != null ? PanelizationSummary.fromJson(json['panelizationSummary']) : null;
  //   imageLinks =ImageLinks.fromJson(json['imageLinks']);
  //   language = json['language'];
  //   previewLink = json['previewLink'];
  //   infoLink = json['infoLink'];
  //   canonicalVolumeLink = json['canonicalVolumeLink'];
  // }

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['title'] = title;
  //   map['authors'] = authors;
  //   map['publisher'] = publisher;
  //   map['publishedDate'] = publishedDate;
  //   map['description'] = description;
  //   if (industryIdentifiers != null) {
  //     map['industryIdentifiers'] = industryIdentifiers?.map((v) => v.toJson()).toList();
  //   }
  //   if (readingModes != null) {
  //     map['readingModes'] = readingModes?.toJson();
  //   }
  //   map['pageCount'] = pageCount;
  //   map['printType'] = printType;
  //   map['categories'] = categories;
  //   map['averageRating'] = averageRating;
  //   map['ratingsCount'] = ratingsCount;
  //   map['maturityRating'] = maturityRating;
  //   map['allowAnonLogging'] = allowAnonLogging;
  //   map['contentVersion'] = contentVersion;
  //   if (panelizationSummary != null) {
  //     map['panelizationSummary'] = panelizationSummary?.toJson();
  //   }
  //   if (imageLinks != null) {
  //     map['imageLinks'] = imageLinks.toJson();
  //   }
  //   map['language'] = language;
  //   map['previewLink'] = previewLink;
  //   map['infoLink'] = infoLink;
  //   map['canonicalVolumeLink'] = canonicalVolumeLink;
  //   return map;
  // }

}
