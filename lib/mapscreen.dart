import 'package:flutter/material.dart';

class CustomWeatherMapScreen extends StatelessWidget {
  const CustomWeatherMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Static map background (replace with your own image)
          Image.asset(
            'assets/map.png', // Add your static map image here
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          // Custom marker for a location
          const Positioned(
            top: 200,
            left: 150,
            child: Column(
              children: [
                Icon(
                  Icons.wb_sunny,
                  size: 40,
                  color: Colors.orange,
                ),
                SizedBox(height: 5),
                Text(
                  '75°F, Sunny',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Another custom marker
          const Positioned(
            top: 350,
            left: 80,
            child: Column(
              children: [
                Icon(
                  Icons.cloud,
                  size: 40,
                  color: Colors.blueGrey,
                ),
                SizedBox(height: 5),
                Text(
                  '70°F, Cloudy',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Overlay for location name and weather details
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'San Francisco',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Current Weather: 75°F, Sunny',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CustomWeatherMapScreen(),
  ));
}
