import 'package:flutter/material.dart';
import 'package:weather1/hourly_screen.dart';

import 'dayforecast_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const WeatherSummaryScreen(),
    const HourlyScreen(),
    DayforecastScreen(),
    // const WeatherMapScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueGrey[800],
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white,),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey[800],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.orangeAccent,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            label: 'Current',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Hourly',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: '7-Day',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.map),
          //   label: 'Map',
          // ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey[800],
              ),
              child: const Text(
                'More Options',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.air),
              title: const Text('Air Quality'),
              onTap: () {
                // Handle air quality tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.warning),
              title: const Text('Weather Alerts'),
              onTap: () {
                // Handle weather alerts tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.wb_twighlight),
              title: const Text('Sunrise & Sunsets'),
              onTap: () {
                // Handle sunrise & sunset tap
              },
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherSummaryScreen extends StatelessWidget {
  const WeatherSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWeatherSummary(),
            const SizedBox(height: 20),
            _buildAirQualityIndex(),
            const SizedBox(height: 20),
            _buildOptions(),
            const SizedBox(height: 20),
            _buildInteractiveMap(),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherSummary() {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.blueGrey[600],
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'San Francisco, CA',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '75°F, Sunny',
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                ),
                SizedBox(height: 4),
                Text(
                  'Feels like 78°F',
                  style: TextStyle(fontSize: 16, color: Colors.white54),
                ),
              ],
            ),
            Icon(
              Icons.wb_sunny,
              size: 60,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAirQualityIndex() {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.blueGrey[700],
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Air Quality Index',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.air,
                  color: Colors.greenAccent,
                  size: 30,
                ),
                SizedBox(width: 10),
                Text(
                  'AQI: 42 (Good)',
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Health Recommendation: It’s a great day to be active outside.',
              style: TextStyle(fontSize: 16, color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptions() {
    return Column(
      children: [
        _buildOptionTile(Icons.directions_car, 'Travel Advisory',
            'No advisories. Roads are clear.'),
        _buildOptionTile(
            Icons.style, 'Clothing Suggestions', 'Light jacket recommended.'),
      ],
    );
  }

  Widget _buildOptionTile(IconData icon, String title, String subtitle) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.blueGrey[800],
      child: ListTile(
        leading: Icon(icon, color: Colors.cyanAccent, size: 30),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }

  Widget _buildInteractiveMap() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Colors.blueGrey, Colors.cyanAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: Text(
          'Interactive Weather Map',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class WeatherMapScreen extends StatelessWidget {
  const WeatherMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Weather Map',
        style: TextStyle(fontSize: 24, color: Colors.grey[800]),
      ),
    );
  }
}
