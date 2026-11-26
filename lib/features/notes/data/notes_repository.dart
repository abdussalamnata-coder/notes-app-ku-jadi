import 'package:notes_app_ku/core/database/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:notes_app_ku/core/database/dabase_provider.dart';

Future<void> addNotes(String title, String content) {
  final database = AppDatabase();
  return database
      .into(database.notesTable)
      .insert(NotesTableCompanion.insert(title: title, content: content));
}

final notesStreamProvider = StreamProvider((ref) {
  final database = ref.watch(databaseProvider);
  return database.select(database.notesTable).watch();
});
