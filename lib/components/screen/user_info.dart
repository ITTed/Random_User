import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomuser_app/components/screen/contacts.dart';
import 'package:randomuser_app/components/screen/user_location.dart';
import 'package:randomuser_app/logic/model/user_model.dart';
import 'package:randomuser_app/screens/bloc/user_bloc.dart';

import 'avatar.dart';

class UserInfo extends StatelessWidget {
  UserInfo({Key? key, this.tabController, this.user}) : super(key: key);
  final TabController? tabController;
  final RandomUser? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xff2C2E31), Colors.deepOrange],
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 16),
            Avatar(
              url: user!.results![0].picture!.large.toString(),
            ),
            SizedBox(height: 16),
            Text(
              user!.results![0].name!.first.toString() +
                  " " +
                  user!.results![0].name!.last.toString(),
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 32),
            Container(
              height: 45.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  30.0,
                ),
              ),
              child: TabBar(
                isScrollable: true,
                controller: tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                  color: Colors.deepOrange[100],
                ),
                labelColor: Colors.indigo,
                unselectedLabelColor: Colors.blueGrey[400],
                tabs: [
                  Tab(
                    text: 'Контакты',
                  ),
                  Tab(
                    text: 'Местоположения',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  UserContact(user: user),
                  UserLocation(location: user!.results![0].location)
                ],
              ),
            ),
            Container(
              width: 150,
              child: ElevatedButton(
                  child: Icon(Icons.replay_outlined),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen,
                      padding: EdgeInsets.only(left: 5, right: 10)),
                  onPressed: () =>
                      BlocProvider.of<UserBloc>(context).add(GetUserEvent())),
            ),
            SizedBox(height: 32)
          ],
        ),
      ),
    );
  }
}
