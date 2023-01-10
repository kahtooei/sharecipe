import 'package:http/http.dart' as http;
import 'package:sharecipe/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProcessFunctionsAPI {
  final _url = Uri.parse("${Constants.URL}/getProcessFunctions");

  Future<dynamic> getProcessFunctions() async {
    final prefs = await SharedPreferences.getInstance();
    int userID = prefs.getInt("id") ?? -1;
    String token = prefs.getString("token") ?? "";

    var response = await http.post(_url, body: {
      "id": userID.toString(),
      "token": token.toString(),
    });
    return response;
  }
}
