import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  final List<String> upcomingEvents = [
    'Concert: JKT48 10th Anniversary Celebration',
    'Fan Meeting: Meet Your Oshi',
    'Album Launch: Harmony of Voices',
    // Add more events as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Events'),
      ),
      body: ListView.builder(
        itemCount: upcomingEvents.length,
        itemBuilder: (context, index) {
          final event = upcomingEvents[index];
          return ListTile(
            title: Text(event),
            // You can add more details like date, time, location, etc.
            // Example: subtitle: Text('Date: January 15, 2024'),
          );
        },
      ),
    );
  }
}
