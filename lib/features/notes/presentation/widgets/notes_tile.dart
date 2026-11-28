import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:notes_app_ku/core/database/app_database.dart';
import 'package:notes_app_ku/features/notes/logic/notes_provider.dart';
import 'package:notes_app_ku/features/notes/presentation/pages/note_form_page.dart';

class NotesTile extends ConsumerWidget {
  final List<NotesTableData> listNotes;
  const new({super.key, required this.listNotes});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: listNotes.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.fromLTRB(24, 4, 24, 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusGeometry.circular(8),
            gradient: LinearGradient(colors: [Colors.green, Colors.grey]),
            boxShadow: [BoxShadow(color: Colors.amber)],
          ),
          child: ListTile(
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Konfirmasi'),
                      actions: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Text('NO'),
                        ),
                        IconButton(
                          onPressed: () {
                            ref
                                .read(notesRepositoryProvider)
                                .deleteNote(id: listNotes[index].id);
                            Navigator.pop(context);
                          },
                          icon: Text('Yes'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.delete),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteFromPage(oldNote: listNotes[index]),
                ),
              );
            },
            subtitle: Text(listNotes[index].content),
            title: Text(listNotes[index].title),
          ),
        );
      },
    );
  }
}
