import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userlist_app/core/services/implementations/secure_storage_service.dart';

final storageServiceProvider = Provider((ref) {
  final storage = SecureStorageService();
  return storage;
});
