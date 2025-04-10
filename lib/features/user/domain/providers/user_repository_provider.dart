import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userlist_app/core/providers/dio_network_provider.dart';
import 'package:userlist_app/features/user/data/repositories/implementations/user_repository_impl.dart';
import 'package:userlist_app/features/user/data/repositories/interfaces/user_repository.dart';

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(ref.watch(networkServiceProvider)),
);
