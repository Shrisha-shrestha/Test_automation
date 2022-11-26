import 'dart:ui';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  final bool selected;

  Product ({required this.image,required this.title,required this.description,
    required this.price,required this.size, required this.id,
    required this.color,
    required this.selected});
}

List<Product> Product_details=[
  Product(
      id: 1,
      title: "Office Code",
      price: 234,
      size: 12,
      description: 'Description......',
      image: "assets/images/bag_1.png",
      color: Color(0xFF3D82AE), selected: false),

  Product(
      id: 2,
      title: "Belt Bag",
      price: 140,
      size: 8,
      description: 'Description......',
      image: "assets/images/bag_2.png",
      color: Color(0xFFD3A984),selected: false),
  Product(
      id: 3,
      title: "Hang Top",
      price: 254,
      size: 10,
      description: 'Description......',
      image: "assets/images/bag_3.png",
      color: Color(0xFF989493),selected: false),
  Product(
      id: 4,
      title: "Old Fashion",
      price: 384,
      size: 11,
      description: 'Description......',
      image: "assets/images/bag_4.png",
      color: Color(0xFFE6B398),selected: false),
  Product(
      id: 5,
      title: "Office Code",
      price: 134,
      size: 12,
      description: 'Description......',
      image: "assets/images/bag_5.png",
      color: Color(0xFFFB7883),selected: false),
  Product(
      id: 6,
      title: "Office Code",
      price: 458,
      size: 12,
      description: 'Description......',
      image: "assets/images/bag_6.png",
      color: Color(0xFFAEAEAF),selected: false)];

