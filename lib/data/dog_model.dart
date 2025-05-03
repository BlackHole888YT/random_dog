class DogModel {
  final String name;
  final String description;
  final LifeSpan life;

  DogModel({
    required this.name,
    required this.description,
    required this.life,
  });

  factory DogModel.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'] as Map<String, dynamic>;
    return DogModel(
      name: attributes['name'] as String,
      description: attributes['description'] as String,
      life: LifeSpan.fromJson(attributes['life'] as Map<String, dynamic>),
    );
  }
}

class LifeSpan {
  final int max;
  final int min;

  LifeSpan({
    required this.max,
    required this.min,
  });

  factory LifeSpan.fromJson(Map<String, dynamic> json) {
    return LifeSpan(
      max: json['max'] as int,
      min: json['min'] as int,
    );
  }
} 