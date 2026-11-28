import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app_ku/core/database/app_database.dart';
import 'package:notes_app_ku/features/notes/logic/notes_provider.dart';

class NoteFromPage extends ConsumerStatefulWidget {
  const NoteFromPage({super.key, this.oldNote});
  final NotesTableData? oldNote;

  @override
  ConsumerState<NoteFromPage> createState() => _NoteFromPageState();
}

class _NoteFromPageState extends ConsumerState<NoteFromPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.oldNote != null) {
      titleController.text = widget.oldNote!.title.toString().trim();
      contentController.text = widget.oldNote!.content.toString();
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.oldNote == null ? 'Add Note' : 'Edit Note'),
        actions: [
          IconButton(
            onPressed: () async {
              final repository = ref.read(notesRepositoryProvider);

              final title = titleController.text.trim();
              final content = contentController.text;

              final String finalTitle = title.isEmpty ? 'newNote' : title;
              if (widget.oldNote == null) {
                await repository.addNote(title: finalTitle, content: content);
              } else {
                await repository.updateNote(
                  id: widget.oldNote!.id,
                  title: finalTitle,
                  content: content,
                );
              }
              if (!context.mounted) return;
              Navigator.pop(context);
            },
            icon: Icon(Icons.check_circle_outline),
            iconSize: 40,
            color: Colors.green,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 4, 4, 12),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(hintText: 'Write your title...'),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 0, 12),
                child: TextField(
                  controller: contentController,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write your note....',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
