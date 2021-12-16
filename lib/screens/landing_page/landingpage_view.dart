import 'package:fast_credit/screens/landing_page/widgets.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:fast_credit/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'landingpage_modelview.dart';

class LandingPage extends StatefulWidget {
  LandingPage() : super();

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<LandingPage> {
  Widget getViewByIndex(int index) {
    switch (index) {
      case 0:
        return LandingPageWidgets().homeTab(context);
      case 1:
        return LandingPageWidgets().paymentTab(context);
      case 2:
        return Container();
      case 3:
        return Container();
      case 4:
        return Container();
      default:
        return Container();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LandingPageViewModel>.withConsumer(
        viewModelBuilder: () => LandingPageViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: AppColors.white,
            body: getViewByIndex(model.currentTabIndex),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (newTab) {
                model.setCurrentTabTo(newTabIndex: newTab);
              },
              currentIndex: model.currentTabIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_outlined),
                  label: 'Payments',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_tree_rounded),
                  label: 'Plan',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.analytics_sharp),
                  label: 'Activity',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_sharp),
                  label: 'Profile',
                ),
              ],
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: AppColors.lightGrey,
            ),
          );
        });
  }
}
