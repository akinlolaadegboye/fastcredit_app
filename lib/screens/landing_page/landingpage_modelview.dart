
import 'package:fast_credit/utils/base_model.dart';

class LandingPageViewModel extends BaseModel {
  int _currentTabIndex = 0;
  int get currentTabIndex => _currentTabIndex;
  void setCurrentTabTo({int newTabIndex}) {
    _currentTabIndex = newTabIndex;
    notifyListeners();
  }
}
