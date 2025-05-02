class Model {
  final String status;
  final String image;

  Model({
    required this.image,
    required this.status,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      status: json['status'],
      image: json['message'],
    );
  }
}