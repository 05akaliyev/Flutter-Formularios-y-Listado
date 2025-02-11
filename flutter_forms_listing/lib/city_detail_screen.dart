import 'package:flutter/material.dart';

class CityDetailScreen extends StatelessWidget {
  final String cityName;
  final String description;
  final String imagePath;

  CityDetailScreen({required this.cityName, required this.description, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(cityName), backgroundColor: Colors.blue),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: cityName,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.image_not_supported, size: 250, color: Colors.grey);
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
