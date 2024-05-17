// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/screens/home.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  final String categoryName;
  final List<Product> products;

  const ProductScreen(
      {Key? key, required this.categoryName, required this.products})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProductScreen createState() => _ProductScreen();
}

class _ProductScreen extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final SearchController controller = SearchController();
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          },
          child: Text(
            widget.categoryName,
            style: TextStyle(
              color: Colors.green, // Cambia el color del texto a verde
              fontWeight: FontWeight.bold,
              fontSize: 25, // Hace que el texto sea negrita
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navegar a la pantalla de carrito al hacer clic en el ícono del carrito
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShoppingCartScreen(),
                ),
              );
            },
          ),
          SearchAnchor(
            searchController: controller,
            builder: (BuildContext context, SearchController controller) {
              return IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  controller.openView();
                },
              );
            },
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              final query = controller.text;
              final filteredProducts = widget.products.where((product) {
                return product.name.toLowerCase().contains(query.toLowerCase());
              }).toList();

              return List<ListTile>.generate(filteredProducts.length,
                  (int index) {
                final String item = filteredProducts[index].name;
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          product: filteredProducts[index],
                        ),
                      ),
                    );
                  },
                );
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          return ProductItem(product: widget.products[index]);
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(
              10.0), // Ajusta el radio según sea necesario
          child: Image.asset(
            product.imagePath,
            width: 70.0, // Ajusta el ancho según sea necesario
            height: 70.0, // Ajusta la altura según sea necesario
            fit: BoxFit.cover,
          ),
        ),
        title: Text(product.name),
        subtitle: Text('\$${product.price.toString()}'),
        onTap: () {
          // Navegar a la pantalla de detalles del producto al hacer clic
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product: product),
            ),
          );
        },
      ),
    );
  }
}

class ShoppingCart extends ChangeNotifier {
  static final ShoppingCart _instance = ShoppingCart._internal();

  factory ShoppingCart() {
    return _instance;
  }

  ShoppingCart._internal();

  final List<Product> _items = [];

  List<Product> get items => List.unmodifiable(_items);

  void addToCart(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}

// ...
class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navegar a la pantalla de carrito al hacer clic en el ícono del carrito
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShoppingCartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.imagePath,
              width: 400.0,
              height: 400.0,
            ),
            Text('\n${product.description.toString()}'),
            Text('\n Precio: \$${product.price.toString()}'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Provider.of<ShoppingCart>(context, listen: false)
                    .addToCart(product);
              },
              child: Text('Agregar al carrito'),
            ),
          ],
        ),
      ),
    );
  }
}

// ...

void addToCart(BuildContext context, Product product) {
  if (kDebugMode) {
    print('Producto agregado al carrito: ${product.name}');
  }

  // Muestra un SnackBar
  final snackBar = SnackBar(
    content: Text('${product.name} agregado al carrito'),
    action: SnackBarAction(
      label: 'Ver carrito',
      onPressed: () {
        // Navegar a la pantalla de carrito al hacer clic en "Ver carrito"
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShoppingCartScreen(),
          ),
        );
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shoppingCart = ShoppingCart();

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de Compras'),
      ),
      body: shoppingCart.items.isNotEmpty
          ? Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: shoppingCart.items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(shoppingCart.items[index].name),
                        subtitle: Text(
                            '\$${shoppingCart.items[index].price.toString()}'),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Realiza la acción de comprar y limpia el carrito
                    buyItems(context, shoppingCart);
                  },
                  child: Text('Comprar'),
                ),
              ],
            )
          : Center(
              child: Text('Tu carrito de compras está vacío.'),
            ),
    );
  }

  void buyItems(BuildContext context, ShoppingCart shoppingCart) {
    // Limpia el carrito
    shoppingCart.clear();

    // Muestra un mensaje de éxito
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Compra exitosa'),
          content: Text(
              'Gracias por tu compra. Los artículos se han comprado con éxito.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el cuadro de diálogo
                Navigator.pop(context); // Cierra la pantalla del carrito
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}

class Product {
  final String name;
  final double price;
  final String imagePath;
  final String description;

  const Product({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.description,
  });
}
