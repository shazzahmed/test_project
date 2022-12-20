import 'package:flutter/material.dart';
import 'package:test_project/main.dart';
import 'package:test_project/model/NoteModel.dart';
import 'package:test_project/screen/HomePage.dart';
import 'package:test_project/services/shared_preferences_services.dart';
import 'package:test_project/utils/LocalDataStorage.dart';
import 'package:test_project/utils/Utils.dart';
import 'package:test_project/utils/Api.dart' as Api;
import 'package:test_project/views/MainScreen.dart';

import '../utils/AppConstants.dart';

class LoginBloc extends ChangeNotifier {
  List<NoteModel> notesList =List.empty(growable: true);
  BuildContext? context;
  LocalDataStorage localDataStorage = LocalDataStorage();
  bool isLoading = false;
  bool isAnimating = true;

  void resetPassword(String email) {
    Api.resetPassword(email).then((value) {
      Utils.showToast("An email link is sent to your email");
    }).catchError((onError) {
    });
  }
  void showLoginForm() {
    isAnimating=false;
    notifyListeners();
  }

  Future<String?> getToken() async {
    //  print( 'getToken1111');
    //  await localDataStorage.clear();
  //  Utils.loginToken = await localDataStorage.getToken();
    Utils.loginToken =  SharedPreferencesService.instance.getStringData(AppConstants.API_TOKEN);
     print("getToken");
     print( Utils.loginToken);
    // Utils.userId = SharedPreferencesService.instance.getStringData(AppConstants.LOCAL_ID);
    //  print(  Utils.userId);
    if (Utils.loginToken != "") {
      // bool? isValid = await Api.signInWithToken(Utils.loginToken!);
      // if (isValid) 
      // MainScreen();
       MyHomePage(title: 'Flutter POS');
      // openHomePage(Utils.loginToken!);
    }
      else {
        showLoginForm();
        return null;
      }
    // }

    return Utils.loginToken;
    // return null;
  }

  signIn(String email, String password) {
    isLoading = true;
    notifyListeners();
    Api.signInUser(email, password).then((token) {
      if (token != null) {
        isLoading = false;
        SharedPreferencesService.instance.saveStringData(AppConstants.API_TOKEN,token);
     //   localDataStorage.saveUserId(Utils.userId!);
        // SharedPreferencesService.instance.saveStringData(AppConstants.LOCAL_ID,Utils.userId!);
        // Api.addLoginTime();
        notifyListeners();
        /*  Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage(token)));*/

        openHomePage(token);
      }
    }).catchError((onError) {
      isLoading = false;
      Utils.showToast(Utils.getErrorMessage(onError));
      notifyListeners();
    });
  }

  void openHomePage(String token) {
    Navigator.pushReplacement(
      context!,
      MaterialPageRoute(builder: (context) => HomePage(token)),
    );
  }

  void register(String email, String password) {
    isLoading = true;
    notifyListeners();
    Api.registerUser(email, password).then((token) {
      if (token != null) {
        isLoading = false;
        SharedPreferencesService.instance.saveStringData(AppConstants.API_TOKEN,token);
     //   localDataStorage.saveToken(token);
      //  localDataStorage.saveUserId(Utils.userId!);
        // SharedPreferencesService.instance.saveStringData(AppConstants.LOCAL_ID,Utils.userId!);
        notifyListeners();

        // Api.addLoginTime();

        openHomePage(token);
      }
    }).catchError((onError) {
      isLoading = false;
      Utils.showToast(Utils.getErrorMessage(onError));
      notifyListeners();
    });
  }
}
