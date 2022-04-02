import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/modules/favourite/favourite.dart';
import 'package:stylish/modules/landingpage/landingpage.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key, this.newPage = false}) : super(key: key);
  final bool newPage;

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
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
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.7),
                    // childAspectRatio: 0.8,
                    clipBehavior: Clip.none,
                    crossAxisSpacing: 18.w,
                    mainAxisSpacing: 16.h,
                    children: favouriteCubit.favourites
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              Navigator.of(ctx)
                                  .pushNamed(
                                '/productPage',
                                arguments: e,
                              )
                                  .then((_) {
                                if (mounted) setState(() {});
                              });
                            },
                            child: FavouriteCard(
                              product: e,
                            ),
                          ),
                        )
                        .toList(),
                  )
                : Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Please click on the',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          WidgetSpan(
                            child: Icon(
                              CupertinoIcons.heart_fill,
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text:
                                'icon when viewing a product to add the item to your favourites list',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.newPage
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
