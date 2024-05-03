import 'package:bloc/bloc.dart';
import 'package:candies_db/features/dashboard/modules/users/model/repo/database_repo.dart';
import 'package:candies_db/features/dashboard/modules/users/model/user_model.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final DatabaseRepo _repo = DatabaseRepo();

  UserCubit() : super(UserLoading()) {
    init();
  }


  List<UserModel> users = [];
  Future<void> init() async {
    emit(UserLoading());
    try {
      await _repo.initDB();
       users = await _repo.fetchUsers();
      if (users.isEmpty) {
        emit(UserEmpty());
      } else {
        emit(UserLoaded(users));
      }
    } catch (e) {
      emit(UserError("Failed to load users: $e"));
    }
  }

}