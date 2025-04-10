import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userlist_app/core/services/implementations/dio_network_service.dart';

final networkServiceProvider = Provider<DioNetworkService>(
  (ref) {
    final dio = Dio();
    return DioNetworkService(dio);
  },
);
