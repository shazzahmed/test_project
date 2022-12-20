import 'package:flutter/cupertino.dart';
import 'package:test_project/blocs/NotesBloc.dart';
import 'package:test_project/model/NoteModel.dart';
import 'package:test_project/utils/LocalDataStorage.dart';
import 'package:test_project/utils/Utils.dart';
import 'package:test_project/utils/Api.dart' as Api;

/// Bloc for [HomePage]
class HomeBloc extends ChangeNotifier {
  List<NoteModel> notesList=List.empty(growable: true);

  NotesBloc notesBloc=NotesBloc.empty();
 // String token;
  String? errorMsg;

  LocalDataStorage localDataStorage = LocalDataStorage();

  /// return notes list to UI
  void getNotes() {
    Utils.showToast("Refreshing...");
    Api.getNotes().then((list) {
      if (list != null && list.isNotEmpty) {
        notesList = list;
        errorMsg = null;
      } else {
        errorMsg = "No data found!";
      }
      notifyListeners();
    }).catchError((error) {
      errorMsg = Utils.getErrorMessage(error);
      Utils.showToast(Utils.getErrorMessage(error));
      notifyListeners();
    });
  }

  /// add new note locally to UI
  void appendList() {
    notesList.insert(0, notesBloc.note!);
    notifyListeners();
  }

  /// add new note locally to UI
  void deleteNote() {
    notesList.remove(notesBloc.note);
    notifyListeners();
  }
}
