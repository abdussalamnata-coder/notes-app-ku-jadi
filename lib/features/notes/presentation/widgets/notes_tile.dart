import 'package:material_ui/material_ui.dart';
import 'package:notes_app_ku/core/database/app_database.dart';

class NotesTile extends StatelessWidget {
  final List<NotesTableData> listNotes;
  const new({super.key, required this.listNotes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listNotes.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(listNotes[index].title));
      },
    );
  }
}
