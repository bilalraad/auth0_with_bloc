import 'dart:convert';

class Breed {
  Breed({
    required this.weight,
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    required this.lap,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.healthIssues,
    required this.sheddingLevel,
    required this.vocalisation,
    required this.wikipediaUrl,
    required this.image,
  });

  final String weight;
  final String id;
  final String name;
  final String temperament;
  final String origin;
  final String description;
  final String lifeSpan;
  final int indoor;
  final int? lap;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int healthIssues;
  final int sheddingLevel;
  final int vocalisation;
  final String? wikipediaUrl;
  final String? image;

  Breed copyWith({
    String? weight,
    String? id,
    String? name,
    String? temperament,
    String? origin,
    String? description,
    String? lifeSpan,
    int? indoor,
    int? lap,
    int? adaptability,
    int? affectionLevel,
    int? childFriendly,
    int? healthIssues,
    int? sheddingLevel,
    int? vocalisation,
    String? wikipediaUrl,
    String? image,
  }) =>
      Breed(
        weight: weight ?? this.weight,
        id: id ?? this.id,
        name: name ?? this.name,
        temperament: temperament ?? this.temperament,
        origin: origin ?? this.origin,
        description: description ?? this.description,
        lifeSpan: lifeSpan ?? this.lifeSpan,
        indoor: indoor ?? this.indoor,
        lap: lap ?? this.lap,
        adaptability: adaptability ?? this.adaptability,
        affectionLevel: affectionLevel ?? this.affectionLevel,
        childFriendly: childFriendly ?? this.childFriendly,
        healthIssues: healthIssues ?? this.healthIssues,
        sheddingLevel: sheddingLevel ?? this.sheddingLevel,
        vocalisation: vocalisation ?? this.vocalisation,
        wikipediaUrl: wikipediaUrl ?? this.wikipediaUrl,
        image: image ?? this.image,
      );

  factory Breed.fromRawJson(String str) => Breed.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
      weight: json["weight"]["metric"],
      id: json["id"],
      name: json["name"],
      temperament: json["temperament"],
      origin: json["origin"],
      description: json["description"],
      lifeSpan: json["life_span"],
      indoor: json["indoor"],
      lap: json["lap"],
      adaptability: json["adaptability"],
      affectionLevel: json["affection_level"],
      childFriendly: json["child_friendly"],
      healthIssues: json["health_issues"],
      sheddingLevel: json["shedding_level"],
      vocalisation: json["vocalisation"],
      wikipediaUrl: json["wikipedia_url"],
      image: json["image"]?["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "weight": weight,
        "id": id,
        "name": name,
        "temperament": temperament,
        "origin": origin,
        "description": description,
        "life_span": lifeSpan,
        "indoor": indoor,
        "lap": lap,
        "adaptability": adaptability,
        "affection_level": affectionLevel,
        "child_friendly": childFriendly,
        "health_issues": healthIssues,
        "shedding_level": sheddingLevel,
        "vocalisation": vocalisation,
        "wikipedia_url": wikipediaUrl,
        "image": image,
      };
}
