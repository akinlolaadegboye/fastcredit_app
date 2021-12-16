import 'package:fast_credit/utils/app_bars.dart';
import 'package:fast_credit/utils/colors.dart';
import 'package:fast_credit/utils/screensize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPageWidgets {
  //homeTab
  homeTab(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBars().mainScreenAppBar(context, 'Hello, Chidinma'),
            balanceItems(context, '300,000'),
            menuItems(
                context,
                'Apply for a Loan',
                'Recieve fund in your account in as little as 5 minutes',
                const Icon(Icons.account_balance),
                Colors.greenAccent.withOpacity(0.3)),
            menuItems(
                context,
                'Invest with Payvest',
                'Earn the highest interest rate by investing in a fixed plan',
                const Icon(Icons.account_balance_wallet),
                Colors.greenAccent.withOpacity(0.3)),
          ],
        ),
      ),
    );
  }
  menuItems(BuildContext context, String title, String subTitle, Icon icon,
      Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: backgroundColor),
      width: ScreenSize.width(context) * .9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: ScreenSize.width(context) * .6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black),
                ),
                Text(subTitle,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.deepGrey))
              ],
            ),
          ),
          CircleAvatar(
              backgroundColor: Colors.blue.withOpacity(0.2),
              child: const Icon(Icons.add_sharp)),
        ],
      ),
    );
  }
  balanceItems(BuildContext context, String balance) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 20,top: 20),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(10),
      ),
      width: ScreenSize.width(context) * .9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Text(
                'BALANCE',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '\$$balance',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: AppColors.white),
              )
            ],
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: const [
                Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Topup',
                  style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }



  //paymentTab
  paymentTab(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
          width: ScreenSize.width(context) - 40,
          child: const Text(
            'Payments',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: AppColors.black),
          ),
        ),
        paymentType(context),
        savedPayments(context)
      ],
    );
  }
  savedPayments(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
         Container(
           margin: const EdgeInsets.only(top: 40,bottom: 20),
           width: ScreenSize.width(context) - 40,
           child: const Text('Saved Payments',
               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: AppColors.grey)),
         ),
          savedPaymentItems(context, 'Nkechi Anuigbo', 'NA', 'N300,000', 'GT BANK'),
          savedPaymentItems(context, 'Cynthia Oroma', 'CO', 'N10,000', 'Access Bank'),
          savedPaymentItems(context, 'David Nwaoha', 'DN', 'N300,000', 'First Bank')
        ],
      ),
    );
  }
  paymentType(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            paymentTypeItems(context, 'Send \nMoney', Colors.greenAccent.withOpacity(0.1),
                Colors.white10, const Icon(Icons.account_balance,color: Colors.greenAccent),0.0),
            paymentTypeItems(context, 'Pay \nBill', Colors.deepPurple.withOpacity(0.1),
                Colors.white10, const Icon(Icons.account_balance_wallet_rounded,color: Colors.deepPurple,),0.0),
            paymentTypeItems(context, 'Data & \nAirtime', Colors.orangeAccent.withOpacity(0.1),
                Colors.white10, const Icon(Icons.account_tree_sharp,color:Colors.orangeAccent),20.0)
          ],
        ),
      ),
    );
  }
  paymentTypeItems(BuildContext context, String typeName, Color backgroundColor,
      Color iconAvatarColor, Icon typeIcon,double marginRight) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin:  EdgeInsets.only(bottom: 20, left: 20,right: marginRight),
      height: 160,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      width: ScreenSize.width(context) * .3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: iconAvatarColor,
            child: typeIcon,
          ),
          const SizedBox(height: 25),
          Text(
            typeName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: AppColors.black),
          )
        ],
      ),
    );
  }
  savedPaymentItems(BuildContext context, String name, String nameInitials,
      String amount, String bank) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      color: AppColors.white,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        width: ScreenSize.width(context) * .9,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.1),
              child: Text(
                nameInitials,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.deepGrey),
              ),
            ),
            const SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.black),),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Text('$amount . ', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.primaryColor),),
                    Text(bank, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.deepGrey),),
                  ],
                )
              ]
            ),
            const SizedBox(width: 20,),
            CircleAvatar(
              backgroundColor: Colors.redAccent.withOpacity(0.1),
              child: const Icon(Icons.cancel, color: Colors.redAccent,)
            ),
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundColor: Colors.greenAccent.withOpacity(0.1),
              child: const Icon(Icons.ac_unit_sharp,color: Colors.greenAccent,)
            ),
          ],
        ),
      ),
    );
  }
}
