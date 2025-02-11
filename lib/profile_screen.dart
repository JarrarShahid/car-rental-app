import 'package:car_rental_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:car_rental_app/db_helper.dart';
import 'package:car_rental_app/login_screen.dart';
import 'package:car_rental_app/home_screen.dart';
import 'package:car_rental_app/search_screen.dart';
import 'package:car_rental_app/favorites_screen.dart';
import 'package:car_rental_app/profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final DBHelper dbHelper = DBHelper();
  String name = "", email = "", contact = "";
  int _selectedIndex = 3;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  void loadUserData() async {
    final user = await dbHelper.getUser();
    setState(() {
      name = user['name'] ?? "";
      email = user['email'] ?? "";
      contact = user['contact'] ?? "";
    });
  }

  void logout() async {
    await dbHelper.logout();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      Widget destination;
      switch (index) {
        case 0:
          destination = const HomeScreen();
          break;
        case 1:
          destination = const SearchScreen();
          break;
        case 2:
          destination = const FavoritesScreen();
          break;
        case 3:
          destination = const ProfileScreen();
          break;
        default:
          return;
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => destination),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(color: AppColors.cardBg),),
        backgroundColor: AppColors.secondary,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.cardBg,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                  SizedBox(height: 5),
                  Text(name, style: TextStyle(fontSize: 16, color: AppColors.textLight)),
                  Divider(),
                  Text("Email:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                  SizedBox(height: 5),
                  Text(email, style: TextStyle(fontSize: 16, color: AppColors.textLight)),
                  Divider(),
                  Text("Contact Number:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                  SizedBox(height: 5),
                  Text(contact, style: TextStyle(fontSize: 16, color: AppColors.textLight)),
                ],
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: logout,
                child: Text('Logout', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            backgroundColor: Colors.transparent,
            selectedItemColor: AppColors.secondary,
            unselectedItemColor: AppColors.textLight,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: "Search"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_outlined), label: "Favorites"),
              BottomNavigationBarItem(icon: Icon(Icons.person_outlined), label: "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}
