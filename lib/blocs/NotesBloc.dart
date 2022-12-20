import 'package:flutter/material.dart';
import 'package:test_project/model/NoteModel.dart';
import 'package:test_project/utils/Utils.dart';
import 'package:test_project/utils/Api.dart' as Api;

class NotesBloc {
  NoteModel? note;
  // NoteModel selectedNote;
  String? token;

  NotesBloc.empty() {
    note = NoteModel();
    note!.colorValue = Colors.red.value;
  }


  void addNote(BuildContext context)async {
    note!.title=note!.title??'';
    note!.description=note!.description??'';
    
   await Api.addNote(note!).then((value) {
    }).catchError((error) {
      Utils.showToast(Utils.getErrorMessage(error));
    });
  }

  void update(BuildContext context)async {
    note!.title=note!.title??'';
    note!.description=note!.description??'';

    await Api.updateData(note!).then((value) {
      }).catchError((error) {
        Utils.showToast(Utils.getErrorMessage(error));
      });

  }

  void delete(BuildContext context) async{
     await Api.deleteNote(note!).then((value) {
      }).catchError((error) {
        Utils.showToast(Utils.getErrorMessage(error));
      });

  }
}
