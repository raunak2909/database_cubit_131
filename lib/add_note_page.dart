import 'package:database_cubit_131/note_cubit/note_cubit.dart';
import 'package:database_cubit_131/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNotePage extends StatelessWidget {
  var titleController = TextEditingController();
  var descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Note'),),

      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
            ),
            SizedBox(
              height: 11,
            ),
            TextField(
              controller: descController,
            ),
            SizedBox(
              height: 21,
            ),
            ElevatedButton(onPressed: (){
              context.read<NoteCubit>().addNote(NoteModel(
                  title: titleController.text.toString(),
                  desc: descController.text.toString()));

              Navigator.pop(context);
            }, child: Text('Add'))
          ],
        ),
      ),
    );
  }
}
