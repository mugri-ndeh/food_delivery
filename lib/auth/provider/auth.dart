import 'package:delivery_app/api/test_api.dart';
import 'package:delivery_app/models/customer.dart';
import 'package:delivery_app/util/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthState {
  loggedIn,
  loggedOut,
  loading,
  finishedOnboard,
  fresh,
  login,
  signup,
}

class Authentication with ChangeNotifier {
  late AuthState _loginState;
  get loginState => _loginState;
  Customer? loggedUser;
  late SharedPreferences preferences;

  setAuthState(AuthState authState) {
    _loginState = authState;
    notifyListeners();
  }

  Authentication() {
    init();
  }

  Future<void> init() async {
    setAuthState(AuthState.loading);

    preferences = await SharedPreferences.getInstance();
    int uid = preferences.getInt('userId') ?? -1;

    if (uid == -1) {
      print('USER LOGGED OUT');
      setAuthState(AuthState.loggedOut);
      notifyListeners();
    } else {
      print('ACCOUNT IS');
      print(uid);
      var res = await TestApi.getuser(uid);
      loggedUser = Customer.fromJson(res);
      print('USER LOGGED IN');
      setAuthState(AuthState.loggedIn);
      notifyListeners();
    }
  }

  Future<Customer?> login(
      BuildContext context, String email, String password) async {
    // try {
    var result = await TestApi.login(email, password);
    if (result == 'failed') {
      setAuthState(AuthState.loggedOut);
      showSnackBar(context, 'There was an error try again');
      notifyListeners();
    } else {
      loggedUser = Customer.fromJson(result);
      await preferences.setInt('userId', loggedUser!.id);
      preferences
          .setInt('id', loggedUser!.id)
          .then((value) => print('YESSSSSSSSSSS'))
          .onError((error, stackTrace) => print(error));
      print('YESSSS');

      setAuthState(AuthState.loggedIn);
      print(_loginState);

      notifyListeners();
    }
    return loggedUser;
    // } catch (e) {
    //   print('OH NO');
    //   return null;
    // } finally {
    //   notifyListeners();
    // }
  }

  Future<String> signup(BuildContext context, Customer user) async {
    String retValue = 'error';
    try {
      var result = await TestApi.signUp(user);
      if (result == 'failed') {
        setAuthState(AuthState.loggedOut);
        showSnackBar(context, 'There was an error try again');
        notifyListeners();
      } else {
        showAlertDialog(context, 'Success',
            'Please go to the login page and enter your details');
        notifyListeners();
      }
    } catch (e) {
      return 'Error creating user. Try again';
    }

    return Future.value(retValue);
  }

  // Future<String> completeProfile(UserModel user) async {
  //   String retValue = 'error';
  //   try {
  //     await _firestore.collection("users").doc(user.uid).update(user.toJson());
  //     retValue = 'success';
  //     setAuthState(AuthState.loggedIn);
  //     notifyListeners();
  //   } on FirebaseException catch (e) {
  //     print(e.message);
  //   }

  //   return Future.value(retValue);
  // }

  Future<Customer?> returnUser(int id) async {
    var user = Customer();

    try {
      var userDoc = await TestApi.getuser(id);
      if (userDoc == 'failed') {
        return null;
      } else {
        user = Customer.fromJson(userDoc);
        print(user.id);
        print('USER RETURNED');
      }

      return user;
    } catch (e) {
      print('There was an error');
      return null;
    }
  }

  void logout() async {
    try {
      await preferences.clear();
      setAuthState(AuthState.loggedOut);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
