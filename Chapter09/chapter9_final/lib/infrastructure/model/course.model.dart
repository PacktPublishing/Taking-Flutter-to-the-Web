import 'dart:convert';

class Course {
  final String id;
  final String title;
  final String description;
  final String image;
  final String status;
  final int publishedDate;
  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.status,
    required this.publishedDate,
  });

  Course copyWith({
    String? id,
    String? title,
    String? description,
    String? image,
    String? status,
    int? publishedDate,
  }) {
    return Course(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      status: status ?? this.status,
      publishedDate: publishedDate ?? this.publishedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'status': status,
      'published_date': publishedDate,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['\$id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      status: map['status'] ?? 'Draft',
      publishedDate: map['published_date']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) => Course.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Course(id: $id, title: $title, description: $description, image: $image, status: $status, publishedDate: $publishedDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Course &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.image == image &&
        other.status == status &&
        other.publishedDate == publishedDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        image.hashCode ^
        status.hashCode ^
        publishedDate.hashCode;
  }
}
