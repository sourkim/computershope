import 'package:flutter/material.dart';
import 'package:project_api/core/constan/color.dart';

import 'package:project_api/provider/cart_provider.dart';
import 'package:project_api/view/checkout_screen.dart';
import 'package:project_api/view/home_screen.dart';
import 'package:project_api/widget/buttomNav.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Buttomnav()),
            );
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: (cartProvider.cartItem.isEmpty)
          ? Center(child: Text("Cart Empty!"))
          : ListView.builder(
              itemCount: cartProvider.cartItem.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 70,
                              height: 70,
                              child: Image.network(
                                cartProvider.cartItem[index].image,
                                fit: BoxFit.cover,
                                width: double.maxFinite,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartProvider.cartItem[index].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  cartProvider.cartItem[index].price
                                          .toString() +
                                      "\$",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  cartProvider.decrement(index);
                                },
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Icon(Icons.remove, size: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  cartProvider.cartItem[index].stock.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  cartProvider.increment(index);
                                },
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 200,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Total :",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                  Spacer(),
                  Text(
                    " \$${cartProvider.total().toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 80),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  foregroundColor: Colors.white,
                  fixedSize: Size(400, 60),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutScreen()),
                  );
                },
                child: Text(
                  'Check Out',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
