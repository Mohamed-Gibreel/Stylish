import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/modules/favourite/cubit/favourite_cubit.dart';
import 'package:stylish/modules/favourite/favourite.dart';
import 'package:stylish/modules/landingpage/landingpage.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key, this.newPage = false}) : super(key: key);
  final bool newPage;

  Widget _pageContent(BuildContext ctx) {
    final favouriteCubit = ctx.read<FavouriteCubit>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: favouriteCubit.favourites.isNotEmpty
                ? GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    // No clue on how to set height of grid item other of this.
                    childAspectRatio: .8725.h / 1.1.h,
                    crossAxisSpacing: 18.w,
                    mainAxisSpacing: 16.h,
                    children: favouriteCubit.favourites
                        .map(
                          (e) => FavouriteCard(
                            product: e,
                          ),
                        )
                        .toList(),
                  )
                : const Text('Empty'),
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
            body: _pageContent(context),
          )
        : _pageContent(context);
  }
}
