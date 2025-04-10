import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userlist_app/features/user/data/repositories/interfaces/user_repository.dart';
import 'package:userlist_app/features/user/domain/providers/user_repository_provider.dart';
import 'package:userlist_app/features/user/presentation/logic/user_state.dart';

final userPageNotifierProvider =
    StateNotifierProvider.autoDispose<UserPageNotifier, UserPageState>(
      (ref) => UserPageNotifier(ref.watch(userRepositoryProvider)),
    );

class UserPageNotifier extends StateNotifier<UserPageState> {
  UserPageNotifier(this.userRepository) : super(LoadingUserPageState()) {
    fetchUsers();
  }
  final UserRepository userRepository;

  static const userPageLimit = 20;

  Future<void> fetchUsers() async {
    var page = 1;
    if (state is DateUserPageState) {
      final currState = state as DateUserPageState;
      state = currState.copyWith(isLoading: true);
      page = (currState.data.length ~/ userPageLimit) + 1;
    }
    final userList = await userRepository.getUserList(
      page: page,
      limit: userPageLimit,
    );

    if (userList == null) {
      if (state is DateUserPageState) {
        state = ErrorUserPageState();
      } else {
        state = (state as DateUserPageState).copyWith(isLoading: false);
      }
    } else {
      if (state is DateUserPageState) {
        state = (state as DateUserPageState).updateList(
          newData: userList,
          isLoading: false,
        );
      } else {
        state = DateUserPageState(data: userList, isLoading: false);
      }
    }
  }
}
