import 'package:flutter/material.dart';
import 'package:randomuser_app/logic/model/user_model.dart';

class UserContact extends StatelessWidget {
  const UserContact({Key? key, this.user, this.dob}) : super(key: key);
  final RandomUser? user;
  final Dob? dob;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Возраст:",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                user!.results![0].dob!.age.toString(),
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          Divider(color: Colors.white),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Пол:",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                user!.results![0].gender!,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          Divider(color: Colors.white),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Email:",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                user!.results![0].email!,
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
          Divider(color: Colors.white),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Номер телефона:",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                user!.results![0].phone!,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          Divider(color: Colors.white),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Имя пользователя:",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                user!.results![0].login!.username.toString(),
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
          Divider(color: Colors.white),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
