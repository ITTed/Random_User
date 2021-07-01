import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomuser_app/components/custom_error.dart';
import 'package:randomuser_app/components/custom_laoding.dart';
import 'package:randomuser_app/components/screen/user_info.dart';
import 'package:randomuser_app/logic/repository/repository.dart';
import 'package:randomuser_app/screens/bloc/user_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final bloc = UserBloc(UserRepository());

  @override
  void initState() {
    bloc.add(GetUserEvent());
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0, backgroundColor: Color(0xff2C2E31)),
      body: BlocBuilder<UserBloc, UserState>(
        bloc: bloc,
        builder: (_context, state) {
          if (state is UserInitial) {
            return CustomLoading();
          } else if (state is UserLoaded) {
            return BlocProvider.value(
              value: bloc,
              child: UserInfo(
                tabController: _tabController,
                user: state.model,
              ),
            );
          } else if (state is UserError) {
            return BlocProvider.value(
              value: bloc,
              child: CustomError(message: state.message.message),
            );
          }
          return BlocProvider.value(
            value: bloc,
            child: CustomError(),
          );
        },
      ),
    );
  }
}
