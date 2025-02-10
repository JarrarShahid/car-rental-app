import 'package:flutter/material.dart';
import 'package:car_rental_app/colors.dart';
import 'package:car_rental_app/data.dart';
import 'package:car_rental_app/car_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("Favorites"),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: featuredCars.isEmpty
            ? Center(
                child: Text(
                  "No favorite cars yet!",
                  style: TextStyle(fontSize: 18, color: AppColors.textLight),
                ),
              )
            : ListView.builder(
                itemCount: featuredCars.length,
                itemBuilder: (context, index) {
                  final car = featuredCars[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CarDetailScreen(car: car)));
                    },
                    child: Card(
                      margin: EdgeInsets.only(bottom: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Image.asset(car.image, height: 60, width: 90),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(car.name,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.textDark)),
                                  SizedBox(height: 5),
                                  Text("\$${car.price}/day",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.secondary)),
                                ],
                              ),
                            ),
                            Icon(Icons.favorite, color: AppColors.secondary),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
