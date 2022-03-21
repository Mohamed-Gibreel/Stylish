import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/l10n/l10n.dart';
import 'package:stylish/modules/landingpage/landingpage.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 33.h,
              ),
              Text(
                l10n.explore,
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                l10n.bestOutfitForYou,
                style: TextStyle(
                  color: Colors.black.withOpacity(.3),
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 25.h),
            ],
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.of(context).pushNamed('/searchPage');
          },
          child: const IgnorePointer(
            child: Hero(
              tag: 'search-bar',
              child: SearchBar(),
            ),
          ),
        ),
        SizedBox(height: 25.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                FilterCard(
                  filterImage: 'assets/homepage/dress.svg',
                  filterText: l10n.dress,
                ),
                SizedBox(
                  width: 17.w,
                ),
                FilterCard(
                  filterImage: 'assets/homepage/shirt.svg',
                  filterText: l10n.shirt,
                ),
                SizedBox(
                  width: 17.w,
                ),
                FilterCard(
                  filterImage: 'assets/homepage/pants.svg',
                  filterText: l10n.pants,
                ),
                SizedBox(
                  width: 17.w,
                ),
                FilterCard(
                  filterImage: 'assets/homepage/t-shirt.svg',
                  filterText: l10n.tShirt,
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.newArrival,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    l10n.seeAll,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(.5),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 190.h,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/productPage');
                    },
                    child: const ProductCard(
                      heroTag: 'shirt-1',
                      icon: 'assets/products/shirt-1.png',
                      price: 265,
                      title: 'Long Sleeve Shirts',
                    ),
                  ),
                  const ProductCard(
                    icon: 'assets/products/shirt-1.png',
                    price: 165,
                    title: 'Casual Nolin',
                  ),
                  const ProductCard(
                    icon: 'assets/products/shirt-1.png',
                    price: 165,
                    title: 'Curved Hem Shirts',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
