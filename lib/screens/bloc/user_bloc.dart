import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:randomuser_app/helper/catch_exception.dart';
import 'package:randomuser_app/logic/model/user_model.dart';
import 'package:randomuser_app/logic/repository/repository.dart';


part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(UserRepository userRepository) : super(UserInitial());
 UserRepository repository = UserRepository();
  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is GetUserEvent) {
      yield UserInitial();
      try {
        RandomUser user = await repository.getUser();
        yield UserLoaded(user);
      } catch (e) {
        yield UserError(CatchException.catchError(e));
      }
    }
  }
}
  
