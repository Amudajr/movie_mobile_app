class MoviesModel {
  String? fullTitle;
  String? rank;
  String? image;
  String? ratings;

  MoviesModel({this.fullTitle, this.rank, this.image, this.ratings});

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
      fullTitle: json['fullTitle'] as String?,
      rank: json['rank'] as String?,
      image: json['image'] as String?,
      ratings: json['ratings'] as String?);
}
