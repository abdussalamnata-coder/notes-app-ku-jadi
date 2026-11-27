import 'package:notes_app_ku/core/database/app_database.dart';

class NotesRepository {
  final AppDatabase _database;
  NotesRepository(this._database);

  Stream<List<NotesTableData>> watchAllNotes() {
    return _database.select(_database.notesTable).watch();
  }
}
