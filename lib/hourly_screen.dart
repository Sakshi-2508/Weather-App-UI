import 'package:flutter/material.dart';

class HourlyScreen extends StatefulWidget {
  const HourlyScreen({super.key});

  @override
  State<HourlyScreen> createState() => _HourlyScreenState();
}

class _HourlyScreenState extends State<HourlyScreen> {
  final List<HourlyForecast> hourlyForecasts = List.generate(
    24,
        (index) => HourlyForecast(
      hour: "${index % 12 == 0 ? 12 : index % 12} ${index < 12 ? 'AM' : 'PM'}",
      temperature: 55 + index % 10,
      condition: index % 3 == 0
          ? 'Sunny'
          : index % 3 == 1
          ? 'Cloudy'
          : 'Rainy',
      icon: index % 3 == 0
          ? Icons.wb_sunny
          : index % 3 == 1
          ? Icons.cloud
          : Icons.grain,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hourly Forecast'),
      ),
      body: SingleChildScrollView(  // Wrap the entire body in a scroll view
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hourlyForecasts.length,
                  itemBuilder: (context, index) {
                    final forecast = hourlyForecasts[index];
                    return Container(
                      width: 150,
                      margin: const EdgeInsets.symmetric(horizontal:1),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.blueGrey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                forecast.icon,
                                size: 40,
                                color: Colors.blueGrey[100],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                forecast.hour,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${forecast.temperature}°F',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                forecast.condition,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.blueGrey[600]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              _buildWeatherInsights(),
              const SizedBox(height: 20),
              _buildHourlySummary(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherInsights() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Weather Insights',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.thermostat,
                size: 40,
                color: Colors.blueGrey[100],
              ),
              const SizedBox(width: 10),
              const Text(
                'UV Index: Moderate',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Icon(
                Icons.poll,
                size: 40,
                color: Colors.blueGrey,
              ),
              SizedBox(width: 10),
              Text(
                'Pollen Count: Low',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHourlySummary() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hourly Summary',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Next few hours: Expect temperatures between 60°F and 75°F with varying conditions.',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '12 PM - 3 PM',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold , color: Colors.black),
              ),
              Text(
                'Sunny, 70°F',
                style: TextStyle(fontSize: 16 , color: Colors.black),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '3 PM - 6 PM',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Partly Cloudy, 75°F',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HourlyForecast {
  final String hour;
  final int temperature;
  final String condition;
  final IconData icon;

  HourlyForecast({
    required this.hour,
    required this.temperature,
    required this.condition,
    required this.icon,
  });
}
