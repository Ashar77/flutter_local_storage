import 'package:flutter/material.dart';
import 'package:local_storage/db/notes_databse.dart';
import 'package:local_storage/models/note.dart';

class ListScreen extends StatefulWidget {
  //const ListScreen({Key? key}) : super(key: key);

  static const routeName = '/list-screen';

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool isLoading = false;
  late List<Note> notes;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();
    super.dispose();
  }

  Future refreshNotes() async {
    setState(() {
      isLoading = true;
    });

    this.notes = await NotesDatabase.instance.readAllNotes();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Screen'),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : notes.isEmpty
                ? Text(
                    'No Notes',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )
                : buildNotes(),
      ),
    );
  }

  Widget buildNotes() => ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(notes[index].title.toString()),
        );
      });
}
