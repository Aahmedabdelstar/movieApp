
class ToyCategoryModel {
  String? titleEn;
  int? id;
  String? titleAr;
  bool? selected;
  List<ToyPaper>? toyPapers;

  ToyCategoryModel({ this.selected = false ,this.titleEn,this.id, this.titleAr, this.toyPapers});

  ToyCategoryModel.fromJson(Map<String, dynamic> json) {
    titleEn = json['titleEn'];
    titleAr = json['titleAr'];
    id = json['key'];
    selected = false;
    if (json['toypapers'] != null) {
      toyPapers = <ToyPaper>[];
      json['toypapers'].forEach((v) {
        toyPapers!.add( ToyPaper.fromJson(v));
      });
    }

  }

}

class ToyPaper {
  int? key;
  String? titleEn;
  String? titleAr;
  String? descriptionEn;
  String? descriptionAr;
  String? age;
  String? downloadLink;
  bool? isFavourite;
  List<ToyImages>? images;

  ToyPaper(
      {this.key,
        this.titleEn,
        this.titleAr,
        this.descriptionEn,
        this.descriptionAr,
        this.age,
        this.isFavourite,
        this.downloadLink,
        this.images});

  ToyPaper.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    titleEn = json['titleEn'];
    titleAr = json['titleAr'];
    descriptionEn = json['descriptionEn'];
    descriptionAr = json['descriptionAr'];
    isFavourite = json['is_favourite'] == 1 ? true : false;
    // isFavourite = false;
    age = json['age'];
    downloadLink = json['downloadLink'];
    if (json['images'] != null) {
      images = <ToyImages>[];
      json['images'].forEach((v) {
        images!.add( ToyImages.fromJson(v));
      });
    }
  }


}

class ToyImages {
  int? key;
  String? image;

  ToyImages({this.key, this.image});

  ToyImages.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    image = json['image'];
  }

}
