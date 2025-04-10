import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userlist_app/app/app_theme.dart';
import 'package:userlist_app/app/localization/localization.dart';
import 'package:userlist_app/app/navigation/app_route.dart';
import 'package:userlist_app/features/user/presentation/logic/user_notifier.dart';
import 'package:userlist_app/features/user/presentation/logic/user_state.dart';
import 'package:userlist_app/features/user/presentation/widgets/user_list.dart';

@RoutePage()
class UserListScreen extends ConsumerStatefulWidget {
  const UserListScreen({super.key});
  static const String routeName = '/userlist';

  @override
  ConsumerState<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends ConsumerState<UserListScreen> {
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userPageNotifierProvider);

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            context.localize('users'),
            style: TextStyle(
              color: context.theme.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: switch (state) {
          LoadingUserPageState() => const Center(
            child: CircularProgressIndicator(),
          ),
          ErrorUserPageState() => Center(
            child: Icon(Icons.error, color: context.theme.error, size: 48),
          ),
          DateUserPageState(data: final users, isLoading: final isLoading) =>
            UserList(
              users: users,
              isLoading: isLoading,
              onUpdateList: () {
                ref.read(userPageNotifierProvider.notifier).fetchUsers();
              },
            ),
        },
      ),
    );
  }
}
