class MoviesModel {
  String? fullTitle;
  String? rank;
  String? image;
  String? ratings;

  MoviesModel({this.fullTitle, this.rank, this.image, this.ratings});

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
      fullTitle: json['type'] as String?,
      rank: json['amount'] as String?,
      image: json['balance'] as String?,
      ratings: json['created'] as String?);
}
