class WallpaperModel {
  String? photographer;
  String? photographerurl;
  int? photographerid;
  SrcModel? src;

  WallpaperModel(
      {this.src, this.photographer, this.photographerid, this.photographerurl});

  factory WallpaperModel.fromMap(Map<String, dynamic> jsondata) {
    return WallpaperModel(
        src: SrcModel.fromMap(jsondata["src"]),
        photographer: jsondata["photographer"],
        photographerid: jsondata["photographerid"],
        photographerurl: jsondata["photographerurl"]);
  }
}

class SrcModel {
  String original;
  String small;
  String portrait;

  SrcModel(
      {required this.original, required this.small, required this.portrait});
  factory SrcModel.fromMap(Map<String, dynamic> jsondata) {
    return SrcModel(
        original: jsondata["original"],
        small: jsondata["small"],
        portrait: jsondata["portrait"]);
  }
}
