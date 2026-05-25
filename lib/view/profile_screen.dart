import 'package:flutter/material.dart';
import 'package:project_api/provider/theme_Provider.dart';
import 'package:project_api/widget/buttomNav.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = context.read<ThemeProvider>().dark;
    final profile =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVA_HrQLjkHiJ2Ag5RGuwbFeDKRLfldnDasw&s";
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
        title: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ClipOval(
                child: Image.network(
                  profile,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),

              Card(
                child: ListTile(
                  leading: Icon(Icons.lightbulb),
                  title: Text("Sweet to ${dark ? "Dark" : "Light"} Mode"),
                  trailing: Icon(dark ? Icons.light_mode : Icons.dark_mode),
                  onTap: () {
                    context.read<ThemeProvider>().toggle();
                  },
                ),
              ),

              Card(
                child: ListTile(
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.language),
                  ),
                  title: Text("Change language"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.phone_android),
                  ),
                  title: Text("Developer"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
