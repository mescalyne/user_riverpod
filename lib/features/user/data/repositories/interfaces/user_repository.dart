import 'package:userlist_app/features/user/data/models/user_model.dart';

abstract class UserRepository {
  Future<List<User>?> getUserList({required int page, required int limit});
}
