import 'package:drift/drift.dart';
import 'package:notes_app_ku/core/database/app_database.dart';

class NotesRepository {
  final AppDatabase _database;
  NotesRepository(this._database);

  Stream<List<NotesTableData>> watchAllNotes() {
    return _database.select(_database.notesTable).watch();
  }

  Future<int> addNote({required String title, required String content}) {
    return _database
        .into(_database.notesTable)
        .insert(NotesTableCompanion.insert(title: title, content: content));
  }

  Future<int> updateNote({
    required int id,
    required String title,
    required String content,
  }) {
    return (_database.update(
      _database.notesTable,
    )..where((tbl) => tbl.id.equals(id))).write(
      NotesTableCompanion(title: Value(title), content: Value(content)),
    );
  }

  Future<int> deleteNote({required int id}) {
    return (_database.delete(
      _database.notesTable,
    )..where((tbl) => tbl.id.equals(id))).go();
  }
}
