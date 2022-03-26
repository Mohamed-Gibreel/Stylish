import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/modules/favourite/favourite.dart';
import 'package:stylish/modules/landingpage/landingpage.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key, this.newPage = false}) : super(key: key);
  final bool newPage;

  Widget _pageContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              // No clue on how to set height of grid item other of this.
              childAspectRatio: .8725.h / 1.1.h,
              crossAxisSpacing: 18.w,
              mainAxisSpacing: 16.h,
              children: const [
                FavouriteCard(),
                FavouriteCard(),
                FavouriteCard(),
                FavouriteCard(),
                FavouriteCard(),
                FavouriteCard(),
                FavouriteCard(),
                FavouriteCard(),
                FavouriteCard(),
                FavouriteCard(),
                FavouriteCard(),
                FavouriteCard(),
                FavouriteCard(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return newPage
        ? Scaffold(
            appBar: CustomAppBar(
              title: const Text(
                'Favourite',
                style: TextStyle(color: Colors.black),
              ),
              leadingWidgetIcon: Icons.arrow_back_ios_new,
              leadingWidgetCb: () {
                Navigator.of(context).pop();
              },
            ),
            body: _pageContent(),
          )
        : _pageContent();
  }
}
