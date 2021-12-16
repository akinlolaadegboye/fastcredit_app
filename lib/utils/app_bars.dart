import 'package:fast_credit/utils/colors.dart';
import 'package:flutter/material.dart';

class AppBars {
  loginScreenAppBar(BuildContext context){
    return Row(
     children: [
       InkWell(
         onTap: (){
           Navigator.pop(context);
         },
         child: Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children: const [
             Icon(Icons.arrow_back, color: AppColors.primaryColor,),
             Text('Back', style: TextStyle(color: AppColors.primaryColor,fontSize: 12),)
           ],
         ),
       )
     ],
    );
  }
  mainScreenAppBar(BuildContext context, String titleString) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: const Icon(Icons.account_circle_outlined,size: 35,),
      title: Center(
        child: Text(
          titleString,
          style: const TextStyle(
              color: Color(0XFF034952),
              fontSize: 25,
              fontWeight: FontWeight.w700),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8, right: 10),
              height: 40,
              width: 40,
              child: const Icon(
                Icons.add_circle_rounded,
                size: 35,
                color: AppColors.black,
              )),
        )
      ],
    );
  }
}
