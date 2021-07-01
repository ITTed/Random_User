import 'package:flutter/material.dart';
import 'package:randomuser_app/logic/model/user_model.dart';

class UserLocation extends StatelessWidget {
  const UserLocation({Key? key, this.location, this.street}) : super(key: key);
  final Location? location;
  final Street? street;

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
                "Страна:",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                location!.country!,
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
                "Город:",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                location!.city!,
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
                "Улица:",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                location!.street!.name.toString() +
                    " " +
                    location!.street!.number.toString(),
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          Divider(color: Colors.white),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Почтовый индкс:",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                location!.postcode.toString(),
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
                "Часовой пояс:",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                location!.timezone!.offset!,
                style: TextStyle(fontSize: 16),
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
