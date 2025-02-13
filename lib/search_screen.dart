import 'package:car_rental_app/car_model.dart';
import 'package:flutter/material.dart';
import 'package:car_rental_app/colors.dart';
import 'package:car_rental_app/data.dart';
import 'package:car_rental_app/car_detail_screen.dart';
import 'package:car_rental_app/home_screen.dart';
import 'package:car_rental_app/favorites_screen.dart';
import 'package:car_rental_app/profile_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<Car> filteredCars = [];

  final int _selectedIndex = 1;
  final FocusNode searchFocusNode = FocusNode();


@override
void initState() {
  super.initState();
  filteredCars = featuredCars;

  
  Future.delayed(Duration(milliseconds: 300), () {
    if (mounted) {
      FocusScope.of(context).requestFocus(searchFocusNode);
    }
  });
}

  void filterSearch(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredCars = [];
      });
      return;
    }

    setState(() {
      Set<Car> searchResults = {
        ...allCars
            .where((car) => car.brand.toLowerCase() == query.toLowerCase()),
        ...featuredCars
            .where((car) => car.brand.toLowerCase() == query.toLowerCase()),
      };
      filteredCars = searchResults.toList();
    });
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
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text(
            "Search",
            style: TextStyle(color: AppColors.cardBg),
          ),
          backgroundColor: AppColors.secondary,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: searchController,
                focusNode: searchFocusNode,
                onSubmitted: filterSearch,
                decoration: InputDecoration(
                  hintText: "Search for cars...",
                  prefixIcon: Icon(Icons.search, color: AppColors.primary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: searchController.text.isEmpty
                    ? Center(
                        child: Text(
                          "Enter a brand name to search.",
                          style: TextStyle(
                              fontSize: 18, color: AppColors.textLight),
                        ),
                      )
                    : filteredCars.isEmpty
                        ? Center(
                            child: Text(
                              "No cars found!",
                              style: TextStyle(
                                  fontSize: 18, color: AppColors.textLight),
                            ),
                          )
                        : ListView.builder(
                            itemCount: filteredCars.length,
                            itemBuilder: (context, index) {
                              final car = filteredCars[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CarDetailScreen(car: car),
                                    ),
                                  );
                                },
                                child: Card(
                                  margin: EdgeInsets.only(bottom: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 5,
                                  child: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Row(
                                      children: [
                                        Image.asset(car.image,
                                            height: 60, width: 90),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                car.name,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.textDark,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                "\$${car.price}/day",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: AppColors.secondary,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
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
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search_outlined), label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_outlined), label: "Favorites"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outlined), label: "Profile"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
