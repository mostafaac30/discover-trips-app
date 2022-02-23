import 'dart:convert';

class DataModel {
  final int id;
  final String name;
  final String description;
  final int price;
  final int stars;
  final int people;
  final int selected_people;
  final String img;
  final String location;
  final String created_at;
  final String updated_at;
  bool isFav = false;
  DataModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stars,
    required this.people,
    required this.selected_people,
    required this.img,
    required this.location,
    required this.created_at,
    required this.updated_at,
  });

  DataModel copyWith({
    int? id,
    String? name,
    String? description,
    int? price,
    int? stars,
    int? people,
    int? selected_people,
    String? img,
    String? location,
    String? created_at,
    String? updated_at,
  }) {
    return DataModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      stars: stars ?? this.stars,
      people: people ?? this.people,
      selected_people: selected_people ?? this.selected_people,
      img: img ?? this.img,
      location: location ?? this.location,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'stars': stars,
      'people': people,
      'selected_people': selected_people,
      'img': img,
      'location': location,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toInt() ?? 0,
      stars: map['stars']?.toInt() ?? 0,
      people: map['people']?.toInt() ?? 0,
      selected_people: map['selected_people']?.toInt() ?? 0,
      img: map['img'] ?? '',
      location: map['location'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) =>
      DataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DataModel(id: $id, name: $name, description: $description, price: $price, stars: $stars, people: $people, selected_people: $selected_people, img: $img, location: $location, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DataModel &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.stars == stars &&
        other.people == people &&
        other.selected_people == selected_people &&
        other.img == img &&
        other.location == location &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        stars.hashCode ^
        people.hashCode ^
        selected_people.hashCode ^
        img.hashCode ^
        location.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
