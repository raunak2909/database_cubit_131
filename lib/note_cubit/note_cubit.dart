import 'package:database_cubit_131/note_cubit/note_state.dart';
import 'package:database_cubit_131/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_database.dart';

class NoteCubit extends Cubit<NoteState>{
  AppDataBase db;
  //1
  NoteCubit({required this.db}):super(NoteInitialState());


  //db methods
  void addNote(NoteModel newNote) async{
    //2
    emit(NoteLoadingState());
    bool check = await db.addNote(newNote);

    if(check){
      //3
      var notes = await db.fetchAllNotes();
      emit(NoteLoadedState(arrNotes: notes));
    } else {
      //4
      emit(NoteErrorState(errorMsg: "Note not Added!"));
    }

  }

  void getAllNotes() async{
    emit(NoteLoadingState());
    var notes = await db.fetchAllNotes();
    emit(NoteLoadedState(arrNotes: notes));
  }



}