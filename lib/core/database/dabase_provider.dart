import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app_ku/core/database/app_database.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});
