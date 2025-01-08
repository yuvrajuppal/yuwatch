import 'package:shared_preferences/shared_preferences.dart';

class shareprefhelper {
  static String usernameIDkey = "username_id";
  static String userpassIDkey = "userpass_id";
  static String favlistIDkey = "favlist_id";
  static String movieorwebslistIDkey = "moviewebslist_id";
  static String loginkeyid= "loginkeyid";
  static String recentmoviesid = "recentmoviesID";
// ------------------------------save data------------------------------------------
  Future<bool> saveusername(String getusername) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(usernameIDkey, getusername);
  }

  Future<bool> saveuserpass(String getuserpass) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userpassIDkey, getuserpass);
  }

  Future<void> savefavlist(List<String> getfavlist) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList(favlistIDkey, getfavlist);
  }

  Future<void> savemovieweblist(List<String> getmovieweb) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList(movieorwebslistIDkey, getmovieweb);
  }
  Future<void> saveRecentmovie(List<String> getRecentmovieweb) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList(recentmoviesid, getRecentmovieweb);
  }

// -----------------------data getter ------------------------------------------

  Future<List<String>?> getfavlist() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getStringList(favlistIDkey) ?? [];
  }
   Future<List<String>?> getmovieweb() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getStringList(movieorwebslistIDkey);
  }
   Future<List<String>?> getrecenmovieweb() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getStringList(recentmoviesid);
  }


  // -----------------------------------logindata------------------------------------
  
  Future<void> saveLoginState(bool isLoggedIn) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool(loginkeyid, isLoggedIn);
}


Future<bool> getLoginState() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(loginkeyid) ?? false; // Default is false
}

// -------------------------------------getuseremail-----------------------------------

  Future<String?>getuseremail ()async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString(usernameIDkey);
}
  Future<String?>getuserpass ()async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString(userpassIDkey);
}
}

