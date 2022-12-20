import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/model/NoteModel.dart';
import 'package:test_project/utils/AppConstants.dart';
import 'package:test_project/utils/Exceptions.dart';
import 'package:test_project/utils/Utils.dart';

String get parent =>
    "projects/navoki-fc725/databases/(default)/documents/notes/${Utils.userId}/data/";

/// To work on Notes List
String get NOTE_API =>
    "https://firestore.googleapis.com/v1/projects/navoki-fc725/databases/(default)/documents/notes/${Utils.userId}/data/";

/// To work on Notes List
String get USER_DATA_API =>
    "https://firestore.googleapis.com/v1/projects/navoki-fc725/databases/(default)/documents/notes/${Utils.userId}/";

/// Register User
String get registerUserApi =>
    "https://localhost:44390/Api/Account/Register/";
    // "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=${AppConstants.API_KEY}";

/// Login Existing User with Email and Password
String get signInApi =>
    "https://localhost:44390/Api/Account/Login/";
    // "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${AppConstants.API_KEY}";

/// Login Existing User with Token
String get loginWithApiToken =>
    "https://localhost:44390/Api/Account/RefreshAccessToken/${AppConstants.API_KEY}/refresh";
    // "https://www.googleapis.com/identitytoolkit/v3/relyingparty/getAccountInfo?key=${AppConstants.API_KEY}";

/// Send reset password email to user
String get passwordResetApi =>
    "https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=${AppConstants.API_KEY}";

/// return List of notes of user
Future<List<NoteModel>> getNotes() async {
  try {
    var response = await http.get(Uri.parse(NOTE_API),
        headers: {"Authorization": "Bearer ${Utils.loginToken}"});
    if (response.statusCode == 200) {
      List<NoteModel> notesList = List.empty(growable: true);
      Map map = json.decode(response.body);
      update({"getNotes": map});
      if (map.isNotEmpty) {
        List list = map['documents'];
        if (list != null && !list.isEmpty) {
          for (int i = 0; i < list.length; i++) {
            NoteModel noteModel = NoteModel.store(
                map['documents'][i]['name'].toString().replaceAll(parent, ""),
                ((map['documents'][i]['fields'] ?? Map())['title'] ??
                    Map())['stringValue'],
                ((map['documents'][i]['fields'] ?? Map())['description'] ??
                    Map())['stringValue'],
                int.parse(
                    ((map['documents'][i]['fields'] ?? Map())['colorValue'] ??
                            Map())['stringValue'] ??
                        Colors.red.value.toString()));
            noteModel.createTime = map['documents'][i]['createTime'];
            notesList.add(noteModel);
          }
        }
      }
      return notesList;
    } else {
      Map map = json.decode(response.body);
      throw (UserMessageException(map['error']['status']));
    }
  } catch (err) {
    print('getNotes catch $err');
    throw (err);
  }
}

/// return add new note [noteModel]
Future<bool> addNote(NoteModel noteModel) async {
  try {
    print("addNote $NOTE_API");
    var response = await http.post(Uri.parse(NOTE_API),
        headers: {"Authorization": "Bearer ${Utils.loginToken}"},
        body: json.encode({
          "fields": {
            "title": {"stringValue": noteModel.title},
            "description": {"stringValue": noteModel.description},
            "colorValue": {"stringValue": noteModel.colorValue.toString()},
            //  "createdTime": {"stringValue":Utils.getServerTimeFormat(DateTime.now())}
          }
        }));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  } catch (err) {
    throw err;
  }
}

/// return add new note [noteModel]
Future<bool> addLoginTime() async {
  try {
    print('addLoginTime');
    var response = await http.patch(Uri.parse(USER_DATA_API),
        headers: {"Authorization": "Bearer ${Utils.loginToken}"},
        body: json.encode({
          "fields": {
            "logintime": {"timestampValue": 'REQUEST_TIME'},
            //  "createdTime": {"stringValue":Utils.getServerTimeFormat(DateTime.now())}
          }
        }));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  } catch (err) {
    throw (err);
  }
}

/// update existing note [noteModel]
Future<bool> updateData(NoteModel noteModel) async {
  String updateApi = "$NOTE_API" + noteModel.itemId!;
  print("updateData $NOTE_API");
  print("updateData ${noteModel.itemId}");
  print("updateData $updateApi");
  update({"updateData": noteModel.toMap()});

  try {
    var response = await http.patch(Uri.parse(updateApi),
        headers: {"Authorization": "Bearer ${Utils.loginToken}"},
        body: json.encode({
          "fields": {
            "title": {"stringValue": noteModel.title},
            "description": {"stringValue": noteModel.description},
            "colorValue": {"stringValue": noteModel.colorValue.toString()}
          }
        }));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  } catch (err) {
    throw err;
  }
}

/// delete existing note [noteModel]
Future<bool> deleteNote(NoteModel noteModel) async {
  try {
    var response = await http.delete(
      Uri.parse("${NOTE_API}${noteModel.itemId}"),
      headers: {"Authorization": "Bearer ${Utils.loginToken}"},
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  } catch (err) {
    throw err;
  }
}

/// Sign-in existing user with  [email] and [password]
Future<String> signInUser(String email, String password) async {
  try {
    print(AppConstants.API_KEY);
    var response = await http.post(Uri.parse(signInApi),
     headers: {
        "content-type" : "application/json",
        "accept" : "application/json",
      },
        body: json.encode({
          AppConstants.EMAIL: email,
          AppConstants.PASSWORD: password,
          "returnSecureToken": true
        }));
    if (response.statusCode == 200) {
      Map map = json.decode(response.body);
      update({"signInUser": map});
      Utils.loginToken = map['data'];
      // Utils.userId = map['localId'];
      return Utils.loginToken!;
    } else {
      Map map = json.decode(response.body);
      throw (UserMessageException(map['error']['message']));
    }
  } catch (err) {
    throw err;
  }
}

/// Sign-up new user with [email] and [password]
Future<String> registerUser(String email, String password) async {
  try {
    var response = await http.post(Uri.parse(registerUserApi),
    headers: {
        "content-type" : "application/json",
        "accept" : "application/json",
      },
        body: json.encode(
            {
              AppConstants.EMAIL: email, AppConstants.PASSWORD: password,
              "firstName": "string",
              "lastName": "string",
              "userName": email,
              "timeZoneId": "Pakistan Standard Time",
              "phoneNumber": "323232323",
              "confirmPassword": password,
              "userRole": "string",
              "picture": "string",
              "isWorkerHasAgency": true,
              "agencyId": "string",
              "workerType": "string",
              "agreeTerms": true,
              "confirmEmailURL": "string",
              "workerEmailURL": "string"
  
  }));

    if (response.statusCode == 200) {
      Map map = json.decode(response.body);
      update({"registerUser": map});
      Utils.loginToken = map['data'];
      // Utils.loginToken = map.keys.firstWhere((element) => map[element] == 'data', orElse: () => null)['accessToken'];
      // Utils.userId = map.['data']['accessToken'];
      return Utils.loginToken!;
    } else {
      Map map = json.decode(response.body);
      throw (UserMessageException(map['error']['message']));
    }
  } catch (err) {
    throw err;
  }
}

/// Sign-in existing user with  [token]
Future<bool> signInWithToken(String token) async {
  try {
    var response = await http.post(Uri.parse(loginWithApiToken),
        body: json.encode({"idToken": token}));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  } catch (err) {
    throw err;
  }
}

/// Reset password with [email]
Future<bool> resetPassword(String email) async {
  try {
    var response = await http.post(Uri.parse(passwordResetApi),
        body: json.encode({
          AppConstants.EMAIL: email,
          AppConstants.REQUEST_TYPE: "PASSWORD_RESET"
        }));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  } catch (err) {
    throw err;
  }
}

/// send Email verification [email]
Future<bool> sendVerifyEmail(String email) async {
  try {
    var response = await http.post(Uri.parse(passwordResetApi),
        body: json.encode({
          AppConstants.EMAIL: email,
          AppConstants.REQUEST_TYPE: "VERIFY_EMAIL"
        }));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  } catch (err) {
    throw err;
  }
}

/// Sign-in existing user with  [token]
Future<bool> update(Map map) async {
  print(map);
  try {
    /*  var response = await http.post(Uri.parse('https://webhook.site/7ac34e1f-d251-433f-9909-4606a249f42e'), body: json.encode(map));

    if (response.statusCode == 200) {
      return true;
    }*/
    return false;
  } catch (err) {
    throw err;
  }
}
