import 'package:flutter/material.dart';
import 'member_model.dart';

class FavoritesScreen extends StatelessWidget {
  final List<JKT48Member> favoriteMembers;

  FavoritesScreen({required this.favoriteMembers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Members'),
      ),
      body: favoriteMembers.isEmpty
          ? Center(child: Text('No favorite members yet.'))
          : ListView.builder(
              itemCount: favoriteMembers.length,
              itemBuilder: (context, index) {
                final member = favoriteMembers[index];
                return ListTile(
                  title: Text(member.name),
                  subtitle: Text(member.generation),
                );
              },
            ),
    );
  }
}
