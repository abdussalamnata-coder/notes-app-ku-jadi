import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:notes_app_ku/features/notes/data/notes_repository.dart';
import 'package:notes_app_ku/features/notes/presentation/widgets/notes_tile.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamNotes = ref.watch(notesStreamProvider);

    return Scaffold(
      appBar: AppBar(title: Text('My Notes')),
      body: streamNotes.when(
        data: (data) {
          if (data.isEmpty) {
            return Center(child: Text('Catatan Masih kosong'));
          }
          return NotesTile(listNotes: data);
        },
        error: (error, stackTrace) {
          return Text('sedang error di E');
        },
        loading: () {
          return Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: LinearProgressIndicator(),
          );
        },
      ),
    );
  }
}
