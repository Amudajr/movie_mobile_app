class SearchModel {
  String? title;
  String? image;
  String? description;
  String? expression;

  SearchModel({this.title, this.image, this.description, this.expression});

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        title: json['title'] as String?,
        image: json['image'] as String?,
        description: json['description'] as String?,
        expression: json['expression'] as String?,
      );
}
