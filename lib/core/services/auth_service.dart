import 'package:fast_credit/core/models/error_model.dart';
import 'package:fast_credit/utils/helpers.dart';
import 'package:fast_credit/utils/http/http_service.dart';
import 'package:fast_credit/utils/http/paths.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  login(String emailAddress, String password) async {
    try {
      HttpService httpService = HttpService(Paths.baseUrl);
      final result = await httpService.get(Paths.login);
      if (result is ErrorModel) {
        showErrorToast('An Error has occurred');
      }
      var data = result.data;
      if (data.toString().contains(emailAddress) && password == 'password') {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('profileEmail', emailAddress);
      } else {
        if (!data.toString().contains(emailAddress)) {
          showToast('No user with this email');
          return ErrorModel('');
        } else if (password != 'password') {
          showToast('Wrong password');
          return ErrorModel('');
        }
      }
      return result;
    } catch (e) {
      showToast('Kindly check your internet connection and try again.');
      return ErrorModel('$e');
    }
  }
}
