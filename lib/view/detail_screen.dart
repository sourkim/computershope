import 'package:flutter/material.dart';
import 'package:project_api/core/constan/color.dart';
import 'package:project_api/model/product.dart';
import 'package:project_api/provider/cart_provider.dart';
import 'package:project_api/provider/favorite_provider.dart';
import 'package:project_api/view/Cart_screen.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  Product item;
  DetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    final favoriteprovider = context.watch<FavoriteProvider>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(item.name),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.read<FavoriteProvider>().toggleFavorite(item);
            },
            icon: Icon(
              favoriteprovider.isFavorite(item)
                  ? Icons.favorite
                  : Icons.favorite_border,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                item.image,
                width: double.infinity,
                height: 350,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  "\$${item.price}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Icon(Icons.circle, size: 10),
                SizedBox(width: 10),
                Text("CPU: ${item.specs.cpu}"),
              ],
            ),
            Row(
              children: [
                Icon(Icons.circle, size: 10),
                SizedBox(width: 10),
                Text("RAM: ${item.specs.ram}"),
              ],
            ),
            Row(
              children: [
                Icon(Icons.circle, size: 10),
                SizedBox(width: 10),
                Text("STORAGE: ${item.specs.storage}"),
              ],
            ),
            Row(
              children: [
                Icon(Icons.circle, size: 10),
                SizedBox(width: 10),
                Text("GPU: ${item.specs.gpu}"),
              ],
            ),
            Row(
              children: [
                Icon(Icons.circle, size: 10),
                SizedBox(width: 10),
                Text("DISPLAY: ${item.specs.display}"),
              ],
            ),
            Row(
              children: [
                Icon(Icons.circle, size: 10),
                SizedBox(width: 10),
                Text("DESCRPTION : ${item.desciption}"),
              ],
            ),
            SizedBox(height: 200),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  foregroundColor: Colors.white,
                  fixedSize: Size(300, 50),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  context.read<CartProvider>().addToCart(
                    Product(
                      id: item.id,
                      name: item.name,
                      price: item.price,
                      image: item.image,
                      desciption: item.desciption,
                      category: item.category,
                      stock: 1,
                      specs: item.specs,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${item.name} add to Cart Successfully"),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  );
                },
                child: Text("Add To Cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
