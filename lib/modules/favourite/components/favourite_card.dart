import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:like_button/like_button.dart';
import 'package:stylish/modules/favourite/cubit/favourite_cubit.dart';
import 'package:stylish/modules/product/product.dart';

class FavouriteCard extends StatefulWidget {
  const FavouriteCard({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  State<FavouriteCard> createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<FavouriteCard> {
  bool isLiked = false;
  // ignore: avoid_positional_boolean_parameters
  Future<bool> onLikeButtonTapped(bool isLiked) async {
    final addFavourite = !isLiked;
    if (addFavourite) {
      BlocProvider.of<FavouriteCubit>(context)
          .addProductToFavorites(widget.product);
    } else {
      BlocProvider.of<FavouriteCubit>(context)
          .removeProductFromFavorites(widget.product);
    }
    return !isLiked;
  }

  @override
  void didChangeDependencies() {
    isLiked = BlocProvider.of<FavouriteCubit>(context)
        .favourites
        .contains(widget.product);
    if (mounted && isLiked) setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 0.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                width: 142.w,
                height: 133.h,
                margin: EdgeInsets.only(bottom: 7.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: const Color(0xFFFFFCFA),
                ),
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Image.asset(
                  widget.product.image,
                ),
              ),
              Positioned(
                right: 5.w,
                top: 5.h,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(left: 2.5.w, top: 5.h),
                  child: LikeButton(
                    isLiked: isLiked,
                    onTap: onLikeButtonTapped,
                    size: 15.w,
                    padding: EdgeInsets.zero,
                    likeBuilder: (bool isLiked) {
                      return isLiked
                          ? SvgPicture.asset(
                              'assets/products/heart.svg',
                              height: 15.h,
                            )
                          : Icon(
                              CupertinoIcons.heart,
                              color: Colors.grey,
                              size: 15.w,
                            );
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 35.h,
            child: Text(
              widget.product.name,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Text(
            '\$${widget.product.price}',
            style: const TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
