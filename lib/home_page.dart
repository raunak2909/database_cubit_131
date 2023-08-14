import 'package:database_cubit_131/add_note_page.dart';
import 'package:database_cubit_131/note_cubit/note_cubit.dart';
import 'package:database_cubit_131/note_cubit/note_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<NoteCubit>().getAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Notes'),
      ),
      body: BlocBuilder<NoteCubit, NoteState>(
        builder: (_, state) {
          if (state is NoteLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NoteErrorState) {
            return Center(
              child: Text('Error: ${state.errorMsg}'),
            );
          } else if (state is NoteLoadedState) {
            return ListView.builder(
                itemCount: state.arrNotes.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: Text('${index + 1}'),
                    title: Text(state.arrNotes[index].title),
                    subtitle: Text(state.arrNotes[index].desc),
                  );
                });
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNotePage(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
