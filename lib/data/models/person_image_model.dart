

class PersonImageModel {
  double? aspectRatio;
  String? filePath;
  double? voteAverage;
  int? voteCount;
  int? width;

  PersonImageModel(
      {this.aspectRatio,
        this.filePath,
        this.voteAverage,
        this.voteCount,
        this.width});

  PersonImageModel.fromJson(Map<String, dynamic> json) {
    aspectRatio = json['aspect_ratio'];
    filePath = json['file_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
  }

}
