import 'package:flutter/material.dart';
import 'package:email_app/backend/backend.dart';
import 'package:email_app/src/pages/detail_screen.dart';
import 'package:email_app/src/widgets/email_widget.dart';
import 'package:email_app/model/email.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  //declaracion de metodos
  void longPress(Email email) {
    setState(() {
      Backend().markEmailAsRead(email.id);
    });
  }

  void swipe(Email email) {
    setState(() {
      Backend().deleteEmail(email.id);
    });
  }

  void ontap(Email email, context) {
    setState(() {
      Backend().markEmailAsRead(email.id);
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen(email: email)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mail App"),
      ),
      body: ListView(
          children: Backend()
              .getEmails()
              .map((email) => EmailWidget(
                    email: email,
                    longPress: longPress,
                    swipe: swipe,
                    ontap: ontap,
                  ))
              .toList()),
    );
  }
}
