import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app_ku/core/database/app_database.dart';
import 'package:notes_app_ku/core/database/dabase_provider.dart';
import 'package:notes_app_ku/features/notes/data/notes_repository.dart';

final Provider<NotesRepository> notesRepositoryProvider =
    Provider<NotesRepository>((ref) {
      final database = ref.watch(databaseProvider);
      return NotesRepository(database);
    }); //

final StreamProvider<List<NotesTableData>> notesStreamProvider =
    StreamProvider<List<NotesTableData>>((ref) {
      final repository = ref.watch(notesRepositoryProvider);
      return repository.watchAllNotes();
    });
