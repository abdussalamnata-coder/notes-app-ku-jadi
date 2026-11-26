import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import './tables/notes_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [NotesTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'catatan_kita'));

  @override
  int get schemaVersion => 1;
}
