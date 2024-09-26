import 'package:flutter/material.dart';

class DayforecastScreen extends StatelessWidget {
  final List<Map<String, dynamic>> weeklyForecast = [
    {
      'day': 'Mon',
      'date': 'Aug 30',
      'icon': Icons.wb_sunny,
      'temperature': '75°F / 55°F',
      'description': 'Sunny',
    },
    {
      'day': 'Tue',
      'date': 'Aug 31',
      'icon': Icons.cloud,
      'temperature': '70°F / 50°F',
      'description': 'Cloudy',
    },
    {
      'day': 'Wed',
      'date': 'Sep 1',
      'icon': Icons.wb_sunny_outlined,
      'temperature': '78°F / 60°F',
      'description': 'Partly Cloudy',
    },
    {
      'day': 'Thu',
      'date': 'Sep 2',
      'icon': Icons.wb_cloudy,
      'temperature': '72°F / 58°F',
      'description': 'Overcast',
    },
    {
      'day': 'Fri',
      'date': 'Sep 3',
      'icon': Icons.grain,
      'temperature': '65°F / 53°F',
      'description': 'Rainy',
    },
    {
      'day': 'Sat',
      'date': 'Sep 4',
      'icon': Icons.wb_sunny,
      'temperature': '80°F / 60°F',
      'description': 'Sunny',
    },
    {
      'day': 'Sun',
      'date': 'Sep 5',
      'icon': Icons.bolt,
      'temperature': '68°F / 57°F',
      'description': 'Thunderstorms',
    },
  ];

  DayforecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('7-Day Forecast'),
      //   backgroundColor: Colors.indigo,
      // ),
      body: ListView.builder(
        itemCount: weeklyForecast.length,
        itemBuilder: (context, index) {
          final forecast = weeklyForecast[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: index % 2 == 0
                        ? [Colors.blueGrey, Colors.blueGrey]
                        : [Colors.blueGrey, Colors.blueGrey],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  leading: Icon(
                    forecast['icon'],
                    size: 40,
                    color: Colors.white,
                  ),
                  title: Text(
                    '${forecast['day']}, ${forecast['date']}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    '${forecast['temperature']} - ${forecast['description']}',
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DayforecastScreen(),
  ));
}
