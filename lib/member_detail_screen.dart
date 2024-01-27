import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'member_model.dart';

class MemberDetailScreen extends StatefulWidget {
  final JKT48Member member;

  MemberDetailScreen({required this.member});

  @override
  _MemberDetailScreenState createState() => _MemberDetailScreenState();
}

class _MemberDetailScreenState extends State<MemberDetailScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.member.name),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              _shareMemberDetails(context, widget.member);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(widget.member.profilePictureUrl),
            ),
            SizedBox(height: 16),
            Text(
              'Generation: ${widget.member.generation}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Birthday: ${widget.member.birthday}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Special Skills: ${widget.member.specialSkills.join(", ")}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.member.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  void _shareMemberDetails(BuildContext context, JKT48Member member) {
    final String message = '''
    Check out ${member.name}'s details:
    Generation: ${member.generation}
    Birthday: ${member.birthday}
    Special Skills: ${member.specialSkills.join(", ")}
    Description: ${member.description}
    #JKT48 #${member.name.replaceAll(' ', '_')}
    ''';

    Share.share(message);
  }

  void _toggleFavorite(BuildContext context, JKT48Member member) {
    setState(() {
      isFavorite = !isFavorite;
    });
  }
}
