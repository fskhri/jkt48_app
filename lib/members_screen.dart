import 'package:flutter/material.dart';
import 'events_screen.dart'; // Import the EventsScreen class
import 'favorites_screen.dart'; // Import the FavoritesScreen class
import 'member_search_delegate.dart';
import 'member_detail_screen.dart';
import 'member_model.dart';

class MembersScreen extends StatefulWidget {
  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  List<JKT48Member> members = [
    JKT48Member(
      name: 'Adzana Shaliha',
      generation: '9th Generation',
      profilePictureUrl:
          'https://media.discordapp.net/attachments/1189628612278759586/1200658670837575780/Ashel.jpg?ex=65c6fb86&is=65b48686&hm=7c7a201b18da682888560e9d8844f56f1d5883ff1cd5739918334a7eece06dfb&=&format=webp&width=418&height=590',
      description: 'This is Adzana Shaliha. She is a part of 9th Generation.',
      birthday: '8 Januari 2005',
      specialSkills: ['Singing', 'Dancing', 'Acting'],
    ),
      JKT48Member(
      name: 'Amanda Sukma',
      generation: '10th Generation',
      profilePictureUrl:
          'https://pbs.twimg.com/media/FxgF83SakAYcmK3?format=jpg&name=900x900',
      description: 'This is Amanda Sukma. She is a part of 10th Generation.',
      birthday: '17 Desember 2004',
      specialSkills: ['Dancing', 'Open War', 'Gaming'],
    ),
      JKT48Member(
      name: 'Angelina Chirsty',
      generation: '7th Generation',
      profilePictureUrl:
          'https://media.discordapp.net/attachments/1189628612278759586/1200658673635164248/Christy.jpg?ex=65c6fb86&is=65b48686&hm=8cda234cd556f4c648486e0de12961f498e764c205280b40593429876c2021cc&=&format=webp&width=418&height=590',
      description: 'This is Angelina Chirsty. She is a part of 7th Generation.',
      birthday: '5 Desember 2005',
      specialSkills: ['Dancing', 'Blah Bloh', 'Filsuf'],
    ),
      JKT48Member(
      name: 'Aurellia',
      generation: '10th Generation',
      profilePictureUrl:
          'https://pbs.twimg.com/media/FxgF83SakAYcmK3?format=jpg&name=900x900',
      description: 'This is Amanda Sukma. She is a part of 10th Generation.',
      birthday: '29 Oktober 2002',
      specialSkills: ['Coach Football', 'Dancing', 'Singing'],
    ),
      JKT48Member(
      name: 'Amanda Sukma',
      generation: '10th Generation',
      profilePictureUrl:
          'https://pbs.twimg.com/media/FxgF83SakAYcmK3?format=jpg&name=900x900',
      description: 'This is Amanda Sukma. She is a part of 10th Generation.',
      birthday: '17 Desember 2004',
      specialSkills: ['Dancing', 'Open War', 'Gaming'],
    ),
  ];

  List<JKT48Member> favoriteMembers = [];
  String searchQuery = '';
  String selectedGeneration = 'New Era';

  @override
  Widget build(BuildContext context) {
    // Filter members based on search query and selected generation
    List<JKT48Member> filteredMembers = members
        .where((member) =>
            member.name.toLowerCase().contains(searchQuery.toLowerCase()) &&
            (selectedGeneration == 'New Era' ||
                member.generation == selectedGeneration))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('JKT48 Members'),
        actions: [
          // ... (existing IconButton widgets)
          // Add the SearchBar
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: MemberSearchDelegate(),
              );
            },
          ),
          // Add the Filter dropdown
          DropdownButton<String>(
            value: selectedGeneration,
            onChanged: (String? newValue) {
              setState(() {
                selectedGeneration = newValue!;
              });
            },
            items: ['New Era']
                .map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
          ),
          // Add the Favorites button
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(
                    favoriteMembers: favoriteMembers,
                  ),
                ),
              );
            },
          ),
          // Add the Events button
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EventsScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredMembers.length,
        itemBuilder: (context, index) {
          final member = filteredMembers[index];
          final isFavorite = favoriteMembers.contains(member);

          return ListTile(
            title: Text(member.name),
            subtitle: Text(member.generation),
            trailing: IconButton(
              icon: Icon(isFavorite ? Icons.star : Icons.star_border),
              onPressed: () {
                setState(() {
                  if (isFavorite) {
                    favoriteMembers.remove(member);
                  } else {
                    favoriteMembers.add(member);
                  }
                });
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: MemberDetailScreen(member: member),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}