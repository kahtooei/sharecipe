import 'package:sharecipe/core/domain/entities/recipe_details.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SaveNewRecipeAPI {
  final _url = Uri.parse("${Constants.URL}/saveNewRecipe");

  /// first >> save recipe data
  /// second >> check and if exist save cover img
  /// third >> route on steps and check if exist save media img
  /// note! >> we can retry sending img to server for several time for each img
  /// saveRecpe method for handle logics and two other method to save recipe and images

  Future<dynamic> saveRecipe(RecipeDetailsEntity recipe) async {
    final prefs = await SharedPreferences.getInstance();
    int userID = prefs.getInt("id") ?? -1;
    String token = prefs.getString("token") ?? "";

    var response = await http.post(_url, body: {
      "id": userID.toString(),
      "token": token.toString(),
      "recipe": recipe.toJson(),
    });
    return response;
  }

  // saveAccountWithImage(RecipeDetailsEntity recipe) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   int userID = prefs.getInt("id") ?? -1;
  //   String token = prefs.getString("token") ?? "";

  //   var request = http.MultipartRequest('POST', _url)
  //     ..fields.addAll({
  //       "id": userID.toString(),
  //       "token": token.toString(),
  //       "recipe": recipe.toJson(),
  //     })
  //     ..files.add(await http.MultipartFile.fromBytes('cover', accountImg,
  //         filename: 'cover'));
  //   var response = await request.send();

  //   response.stream.transform(utf8.decoder).listen((value) {
  //     try {
  //       final body = json.decode(value);
  //       if (body['responseStatus'] == "OK") {
  //         Map resData = body['data'];
  //         setState(() {
  //           doChange = true;
  //           isLoading = false;
  //           isError = false;
  //           txtAmountController.text = "";
  //           txtTitleController.text = "";
  //           txtOwnerController.text = "";
  //           txtBankController.text = "";
  //           txtIBANController.text = "";
  //           txtNumberController.text = "";
  //           txtCardController.text = "";
  //           amount = -1;
  //           txtDetailsController.text = "";
  //           setAmount = false;
  //           setAccountImg = false;
  //           errorMessage = "";
  //         });
  //         showSavedMessage();
  //       } else {
  //         errorMessage = body['error'];
  //         showSavedMessage(Error: errorMessage);
  //         setState(() {
  //           isLoading = false;
  //           isError = false;
  //         });
  //       }
  //     } catch (e) {
  //       setState(() {
  //         isLoading = false;
  //         isError = true;
  //       });
  //     }
  //   });
  //   if (response.statusCode == 201) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
