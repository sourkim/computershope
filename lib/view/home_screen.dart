import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_api/service/api_service.dart';
import 'package:project_api/view/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search in Laptops",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Icon(Icons.tune),
                ),
              ],
            ),
            SizedBox(height: 30),
            CarouselSlider(
              items: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1CLhLFXh0Oy-qVGbaEi8wz_-ixS8Ckt_t7Q&s",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    "https://i.pinimg.com/736x/13/e5/cd/13e5cd704f9ed67fc562481be03db292.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    "https://i.pinimg.com/736x/68/58/ee/6858ee8b4207ec19f572609a289c574d.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    "https://i.pinimg.com/736x/21/a5/39/21a539f6234f92d3b901b51e813b6780.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Products",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text("View all", style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: FutureBuilder(
                future: ApiService.getProduct(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }
                  if (!snapshot.hasData) {
                    return Center(child: Text("No Data"));
                  }
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 260,
                      childAspectRatio: 2 / 3,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(item: snapshot.data![index]),
                            ),
                          );
                        },
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Icon(Icons.favorite_border),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Image.network(
                                      snapshot.data![index].image,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: 120,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Center(
                                              child: Icon(
                                                Icons.broken_image_outlined,
                                              ),
                                            );
                                          },
                                    ),
                                  ),
                                ),
                                Text(
                                  snapshot.data![index].name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "USA: ${snapshot.data![index].price}",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.add_circle,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
