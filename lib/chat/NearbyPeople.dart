import 'package:cinch/chat/ChatRoom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NearbyPeople extends StatefulWidget {
  NearbyPeople({Key? key}) : super(key: key);
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  State<NearbyPeople> createState() => _NearbyPeopleState();
}

class _NearbyPeopleState extends State<NearbyPeople> {
  List<String>? _users;
  List<Map<String, dynamic>> userlist = [];

  @override
  void initState() {
    super.initState();
    onSearch();
  }

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  _buildList() {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    return ListView.builder(
        itemCount: _users!.length,
        itemBuilder: ((context, index) => ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 25.0),
              title: Text(_users![index]),
              onTap: () {
                String roomId =
                    chatRoomId(_auth.currentUser!.displayName!, _users![index]);
                print(roomId);

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ChatRoom(
                      chatRoomId: roomId,
                      userMap: userlist[index],
                    ),
                  ),
                );
              },
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child:
              _users == null ? const CircularProgressIndicator() : _buildList(),
        ),
      ),
    );
  }

  onSearch() async {
    try {
      FirebaseFirestore _firestore = FirebaseFirestore.instance;
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final usr = await _firestore
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .get();
      final place = (usr.data() as Map<String, dynamic>)["place"];

      final doc = await _firestore
          .collection('users')
          .where("place", isEqualTo: place)
          .get();
      List<String> users = [];
      for (var usee in doc.docs) {
        userlist.add((usee.data()));
      }
      print(userlist.length);

      for (var user in doc.docs) {
        users.add((user.data())["name"]);
      }

      setState(() {
        _users = users;
      });
    } catch (e) {
      print(e);
    }
  }
}
