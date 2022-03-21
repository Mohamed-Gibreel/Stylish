import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/modules/favourite/favourite.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
