import 'dart:convert';

import 'package:flutter/material.dart';

class Content {
  final String name;
  final String imageUrl;
  final String? titleImageUrl;
  final String? videoUrl;
  final String? description;
  final Color? color;

  const Content({
    required this.name,
    required this.imageUrl,
    this.titleImageUrl,
    this.videoUrl,
    this.description,
    this.color,
  });

  Content copyWith({
    String? name,
    String? imageUrl,
    String? titleImageUrl,
    String? videoUrl,
    String? description,
    Color? color,
  }) {
    return Content(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      titleImageUrl: titleImageUrl ?? this.titleImageUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      description: description ?? this.description,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'imageUrl': imageUrl});
    result.addAll({'titleImageUrl': titleImageUrl});
    result.addAll({'videoUrl': videoUrl});
    result.addAll({'description': description});
    result.addAll({'color': color!.value});
  
    return result;
  }

  factory Content.fromMap(Map<String, dynamic> map) {
    return Content(
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      titleImageUrl: map['titleImageUrl'] ?? '',
      videoUrl: map['videoUrl'] ?? '',
      description: map['description'] ?? '',
      color: Color(map['color']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Content.fromJson(String source) => Content.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Content(name: $name, imageUrl: $imageUrl, titleImageUrl: $titleImageUrl, videoUrl: $videoUrl, description: $description, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Content &&
      other.name == name &&
      other.imageUrl == imageUrl &&
      other.titleImageUrl == titleImageUrl &&
      other.videoUrl == videoUrl &&
      other.description == description &&
      other.color == color;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      imageUrl.hashCode ^
      titleImageUrl.hashCode ^
      videoUrl.hashCode ^
      description.hashCode ^
      color.hashCode;
  }
}
