import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/modules/landingpage/landingpage.dart';
import 'package:stylish/modules/myorders/my_orders.dart';
import 'package:stylish/util/constants.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int activeIndex = 0;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingWidgetIcon: Icons.arrow_back_ios_new,
        leadingWidgetCb: () {
          Navigator.of(context).pop();
        },
        title: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: const Text(
            'My Orders',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TabBar(
              controller: _tabController,
              indicatorColor: Constants.primaryColor,
              indicatorWeight: 3,
              labelColor: Constants.primaryColor,
              unselectedLabelColor: Colors.black,
              tabs: [
                Container(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: const Text(
                    'Completed',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: const Text(
                    'Cancelled',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      const CompletedOrderItem(
                        name: 'Henley Shirts',
                        date: 'Today',
                        icon: 'assets/products/shirt-3.png',
                        price: 250,
                      ),
                      const CompletedOrderItem(
                        name: 'Causal Shirts',
                        date: '20 Jan’2021',
                        icon: 'assets/products/shirt-2.png',
                        price: 145,
                      ),
                      const CompletedOrderItem(
                        name: 'Casual Nolin',
                        date: '20 Mar’2021',
                        icon: 'assets/products/shirt-4.png',
                        price: 225,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const Text('hehe'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          const Text('My orders screen'),
        ],
      ),
    );
  }
}
