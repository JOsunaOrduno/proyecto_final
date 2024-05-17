// ignore_for_file: file_names, unused_import, prefer_const_constructors

import 'package:flutter/material.dart';

import '../screens/product_screen.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String image;
  final List<Product> products;

  const CategoryItem({
    Key? key,
    required this.name,
    required this.image,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.asset(
          image,
          width: 70.0, // Ajusta el ancho según sea necesario
          height: 70.0, // Ajusta la altura según sea necesario
          fit: BoxFit.cover,
        ),
        title: Text(name),
        onTap: () {
          // Navegar a la pantalla de productos al hacer clic en una categoría
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ProductScreen(categoryName: name, products: products),
            ),
          );
        },
      ),
    );
  }
}

final List<Product> perifericosProducts = [
  Product(
      name: 'Audifonos Logitech G733 LIGHTSPEED',
      price: 25000.0,
      imagePath: 'assets/images/1.jpg',
      description:
          'Audífonos Inalámbricos Gaming, LIGHTSPEED, RGB LIGHTSYNC, tecnología de micrófono Blue VO!CE, batería de 29 horas, tecnología DTS Headphone:X 2.0., PC, PS4 - Negro.'),
  Product(
      name: 'Mouse G502 HERO',
      price: 30000.0,
      imagePath: 'assets/images/mouse.jpg',
      description:
          'Mouse Gaming con Cable, Sensor Hero 25K, LIGHTSYNC RGB, Peso Ajustable, 11 Botones programables, Memoria integrada - Negro'),
  // Agrega más productos según sea necesario
];

final List<Product> tvProducts = [
  Product(
      name: 'LG ThinQ Smart TV ',
      price: 4119.0,
      imagePath: 'assets/images/lg.jpg',
      description:
          'LG Pantalla 32" Smart TV LED AI ThinQ HD 32LQ630BPSA (2022)'),
  Product(
      name: 'Samsung QLED Smart TV ',
      price: 8631.0,
      imagePath: 'assets/images/samsung.jpg',
      description:
          'SAMSUNG QLED 4K Q60C Series Quantum HDR de 32 Pulgadas, Doble LED, Seguimiento de Objetos Sound Lite, Q-Symphony, Motion Xcelerator, Gaming Hub, Smart TV con Alexa Incorporado (QN32Q60C, Modelo 2023)'),
  // Agrega más productos según sea necesario
];

final List<Product> phoneProducts = [
  Product(
      name: 'iPhone 15 Pro Max',
      price: 28999.0,
      imagePath: 'assets/images/iphone.jpg',
      description: 'Apple iPhone 15 Pro MAX (256 GB) - Titanio Blanco'),
  Product(
      name: 'Samsung S23',
      price: 13799.0,
      imagePath: 'assets/images/s23.jpg',
      description:
          'SAMSUNG Galaxy S23 8GB_256GB Negro Desbloqueado (Versión Extranjera)'),
  Product(
      name: 'Pixel 8 Pro',
      price: 23429.0,
      imagePath: 'assets/images/pixel.jpg',
      description:
          'Google Pixel 8 Pro 5G | Unlocked Dual SIM (Nano-SIM, eSIM) | 6.7-Inch Android Smartphone (Obsidian, 128GB + 12GB RAM)'),
  // Agrega más productos según sea necesario
];

final List<Product> compuProducts = [
  Product(
      name: 'Xtreme PC Gamer',
      price: 6269.0,
      imagePath: 'assets/images/pc1.jpg',
      description:
          'Xtreme PC Gamer AMD Radeon Vega Renoir Ryzen 5 5600G 16GB SSD 120GB 2TB WiFi Black'),
  Product(
      name: 'CyberpowerPC Gamer Xtreme ',
      price: 36450.0,
      imagePath: 'assets/images/pc2.jpg',
      description:
          'CyberpowerPC Gamer Xtreme VR Gaming PC, Intel Core i9-13900KF 3.0GHz, GeForce RTX 4070 12GB, 16GB DDR5, 1TB NVMe SSD, Wi-Fi Ready & Windows 11 Home (GXiVR8080A36), NegroCyberpowerPC Gamer Xtreme VR Gaming PC, Intel Core i9-13900KF 3.0GHz, GeForce RTX 4070 12GB, 16GB DDR5, 1TB NVMe SSD, Wi-Fi Ready & Windows 11 Home (GXiVR8080A36), Negro'),
  // Agrega más productos según sea necesario
];

final List<Product> consoleProducts = [
  Product(
      name: 'PlayStation 5 ',
      price: 939.0,
      imagePath: 'assets/images/play52.jpg',
      description: 'Consola PlayStation 5 - Versión Standard Nacional'),
  Product(
      name: 'Xbox Series X',
      price: 11499.0,
      imagePath: 'assets/images/seriesx.jpg',
      description: 'Microsoft Game Studios - Consola Xbox Series X'),
  Product(
      name: 'Nintendo Switch OLed',
      price: 5399.0,
      imagePath: 'assets/images/switch.jpg',
      description:
          'Nintendo Switch OLED w/ White Joy-Con - Standard Edition (Internacional)'),
  // Agrega más productos según sea necesario
];

final List<Product> genearlProducts = List.from(consoleProducts)
  ..addAll(compuProducts)
  ..addAll(phoneProducts)
  ..addAll(perifericosProducts)
  ..addAll(tvProducts);
