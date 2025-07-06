import 'dart:io';

class AddProductInputEntity {
  final String name, code, size,color;
  final num price;
  final File image;
  final bool isFeatured;
  final String? imageUrl;

  AddProductInputEntity({
    required this.name,
    required this.code,
    required this.size,required this.color,
    required this.price,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
  });
}
