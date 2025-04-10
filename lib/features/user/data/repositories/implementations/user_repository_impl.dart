import 'dart:developer';

import 'package:userlist_app/core/services/implementations/dio_network_service.dart';
import 'package:userlist_app/features/user/data/models/user_model.dart';
import 'package:userlist_app/features/user/data/repositories/interfaces/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(this.networkService);

  final DioNetworkService networkService;

  @override
  Future<List<User>?> getUserList({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await networkService.get(
        'users',
        queryParameters: {'limit': limit, 'page': page},
      );
      if (response.statusCode == 200) {
        final result = UserResponse.fromJson(
          response.data as Map<String, dynamic>,
        );
        return result.users;
      } else {
        throw Exception('status code ${response.statusCode}');
      }
    } on Exception catch (ex) {
      log('UserRepository getUserList error: $ex');
      return null;
    }
  }
}
