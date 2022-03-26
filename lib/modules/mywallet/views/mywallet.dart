import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/modules/landingpage/landingpage.dart';
import 'package:stylish/modules/mywallet/mywallet.dart';
import 'package:stylish/util/constants.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingWidgetIcon: Icons.arrow_back_ios_new,
        leadingWidgetCb: () {
          Navigator.of(context).pop();
        },
        title: const Text(
          'My Wallets',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40.h,
          ),
          SizedBox(
            height: 157.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                SizedBox(
                  width: 10.w,
                ),
                const Align(
                  child: CustomCreditCard(cardHolderName: 'Mohamed Adil'),
                ),
                const Align(
                  child: CustomCreditCard(cardHolderName: 'Mohamed Adil'),
                ),
                const Align(
                  child: CustomCreditCard(cardHolderName: 'Mohamed Adil'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 10.w,
                height: 10.h,
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(.15),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 10.w,
                height: 10.h,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: const BoxDecoration(
                  color: Constants.primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 10.w,
                height: 10.h,
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(.15),
                  shape: BoxShape.circle,
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  'Recent transactions',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: const [
                RecentTransactionCard(
                  name: 'Casual Shirts',
                  price: 250,
                  icon: 'assets/products/shirt-1.png',
                  date: "23 Mar'2021",
                ),
                RecentTransactionCard(
                  name: 'Casual Shirts',
                  price: 250,
                  icon: 'assets/products/shirt-1.png',
                  date: "23 Mar'2021",
                ),
                RecentTransactionCard(
                  name: 'Casual Shirts',
                  price: 250,
                  icon: 'assets/products/shirt-1.png',
                  date: "23 Mar'2021",
                ),
                RecentTransactionCard(
                  name: 'Casual Shirts',
                  price: 250,
                  icon: 'assets/products/shirt-1.png',
                  date: "23 Mar'2021",
                ),
                RecentTransactionCard(
                  name: 'Casual Shirts',
                  price: 250,
                  icon: 'assets/products/shirt-1.png',
                  date: "23 Mar'2021",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
