import 'package:flutter/material.dart';
import 'package:notepad_app/database/notes_database.dart';
import 'package:notepad_app/screens/note_cart.dart';
import 'package:notepad_app/screens/note_dailog.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<Map<String, dynamic>> notes = [];

  @override
  void initState() {
    super.initState();
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    final fetchNotes = await NotesDatabase.instance.getNotes();

    setState(() {
      notes = fetchNotes;
    });
  }

  final List<Color> noteColors = [
    const Color(0xFFFF5FE5), // Light Purple
    const Color(0xFFFFF35E), // Light Orange
    const Color(0xFF6EFEFF), // Light Blue
    const Color(0xFFFFC4EC), // Light Pink
    const Color(0xFF90F0FC), // Baby Blue
    const Color(0xFFFF7A8C), // Light Red
    const Color(0xFF00FFFF), // Light Cyan
    const Color(0xFFFFD9A5), // Light Peach
    const Color(0xFFFFF098), // Moccasin
    const Color(0xFF9FB495), // Pale Green
    const Color(0xFFFFD700), // Gold
    const Color(0xFFAFE2E0), // Pale Turquoise
    const Color(0xFFFFAEC1), // Light Pink
    const Color(0xFFFFAD23), // Light Goldenrod Yellow
    const Color(0xFFD3D3D3), // Light Grey
  ];

  void showNoteDialog({
    int? id,
    String? title,
    String? content,
    int? colorIndex = 0,
  }) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return NoteDailog(
          colorIndex: colorIndex,
          noteColors: noteColors,
          noteId: id,
          title: title,
          content: content,
          onNoteSaved:
              (
                newTitle,
                newDescription,
                selectedColorIndex,
                currentDate,
              ) async {
                if (id == null) {
                  await NotesDatabase.instance.addNote(
                    newTitle,
                    newDescription,
                    currentDate,
                    selectedColorIndex,
                  );
                } else {
                  await NotesDatabase.instance.updateNotes(
                    newTitle,
                    newDescription,
                    currentDate,
                    selectedColorIndex,
                    id,
                  );
                }
                fetchNotes();
              },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Notes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showNoteDialog();
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, color: Colors.black87),
      ),
      body: notes.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notes_outlined, size: 28, color: Colors.grey[600]),

                  const SizedBox(height: 20),

                  Text(
                    'No Notes Found!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];

                  return NoteCard(
                    note: note,
                    onDelete: () async {
                      await NotesDatabase.instance.deleteNote(note['id']);
                      fetchNotes();
                    },
                    onTap: () async {
                      showNoteDialog(
                        id: note['id'],
                        title: note['title'],
                        content: note['description'],
                        colorIndex: note['color'],
                      );
                    },
                    noteColors: noteColors,
                  );
                },
              ),
            ),
    );
  }
}
