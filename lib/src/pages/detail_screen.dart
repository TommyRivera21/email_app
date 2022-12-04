import 'package:flutter/material.dart';
import 'package:email_app/model/email.dart';

class DetailScreen extends StatelessWidget {
  final Email email;
  const DetailScreen({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(email.subject),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('from: ' + email.from),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Text(email.subject),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Text(email.dateTime.toString()),
            const Divider(),
            const Padding(padding: EdgeInsets.all(30)),
            Text(email.body)
          ],
        ),
      ),
    );
  }
}
