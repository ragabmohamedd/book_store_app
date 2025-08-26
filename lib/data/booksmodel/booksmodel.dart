import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String? title;
  final String? authors;
  final String? description;
  final String imageUrl;

  const Book({
    this.title,
    this.authors,
    this.description,
    required this.imageUrl,
  });

  /// تحويل من JSON
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title']?.toString() ?? '',
      authors: json['authors']?.toString(),
      description: json['description']?.toString(),
      imageUrl: json['imageUrl'].toString(),
    );
  }

  /// تحويل لـ JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'authors': authors,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  @override
  List<Object?> get props => [title, authors, description, imageUrl];
}
