import 'package:flutter/material.dart';
import 'members_screen.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JKT48 App',
      theme: JKT48Theme.lightTheme,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JKT48 Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MembersScreen()),
                );
              },
              child: Text('View Members'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Tambahkan navigasi atau tindakan untuk fitur lainnya di sini
                // Contoh: Navigator.push(context, MaterialPageRoute(builder: (context) => OtherScreen())),
              },
              child: Text('Other Feature'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Tambahkan navigasi atau tindakan untuk fitur lainnya di sini
                // Contoh: Navigator.push(context, MaterialPageRoute(builder: (context) => AnotherScreen())),
              },
              child: Text('Another Feature'),
            ),
          ],
        ),
      ),
    );
  }
}
