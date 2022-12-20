import 'package:flutter/material.dart';

class UserNameWidget extends StatelessWidget {
  // const UserNameWidget({Key? key}) : super(key: key);
  String userName;
  String firstLetter;
  UserNameWidget(this.userName, this.firstLetter);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(15.0))),
      child: Row(
        children: [
          CircleAvatar(
            radius: 12,
            child: Text(firstLetter),
          ),
          SizedBox(
            width: 15,
          ),
          Text(userName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
