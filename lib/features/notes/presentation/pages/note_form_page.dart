import 'package:material_ui/material_ui.dart';
import 'package:notes_app_ku/core/database/tables/notes_table.dart';

class NoteFromPage extends StatefulWidget {
  const NoteFromPage({super.key, this.oldNote});
  final NotesTable? oldNote;

  @override
  State<NoteFromPage> createState() => _NoteFromPageState();
}

class _NoteFromPageState extends State<NoteFromPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final _fromKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.oldNote != null) {
      titleController.text = widget.oldNote!.title.toString();
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
        title: Text('Add Note'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.check_circle_outline),
            iconSize: 40,
            color: Colors.green,
          ),
        ],
      ),
      body: Form(
        key: _fromKey,
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 4, 4, 12),
                  child: TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: 'Write your title...',
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Title wajid di isi yaa';
                      }
                      return null;
                    },
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
      ),
    );
  }
}
