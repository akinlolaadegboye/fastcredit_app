import 'package:fast_credit/core/models/error_model.dart';
import 'package:fast_credit/core/models/success_model.dart';
import 'package:fast_credit/core/services/auth_service.dart';
import 'package:fast_credit/screens/landing_page/landingpage_view.dart';
import 'package:fast_credit/utils/base_model.dart';
import 'package:fast_credit/utils/locator.dart';
import 'package:get/get.dart';


class LoginViewModel extends BaseModel {
  final Authentication _authentication = locator<Authentication>();
  signIn(String emailAddress, String password) async {
    var result = await _authentication.login(emailAddress,password);
    if (result is ErrorModel) {
      return ErrorModel(result.error);
    }
    if(result is SuccessModel){
      Get.offAll(LandingPage());
    }
  }
}