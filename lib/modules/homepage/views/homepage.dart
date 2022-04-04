import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/l10n/l10n.dart';
import 'package:stylish/modules/filter/filter.dart';
import 'package:stylish/modules/landingpage/landingpage.dart';
import 'package:stylish/modules/product/product.dart';

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
          child: IgnorePointer(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: const Hero(
                tag: 'search-bar',
                child: SearchBar(),
              ),
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
                BlocBuilder<FilterCubit, FilterState>(
                  builder: (context, state) {
                    if (state is FilterLoadingInProgess) {
                      return const Text('Loading');
                    } else {
                      final state = BlocProvider.of<FilterCubit>(context);
                      return Row(
                        children: state.filters
                            .map(
                              (filter) => Container(
                                margin: EdgeInsets.only(right: 17.w),
                                child: Material(
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(15.r),
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      if (filter.isSelected == true) {
                                        BlocProvider.of<ProductCubit>(context)
                                            .removeFilter();
                                      } else {
                                        BlocProvider.of<ProductCubit>(context)
                                            .filterProducts(filter.name);
                                      }
                                      BlocProvider.of<FilterCubit>(context)
                                          .selectFilter(filter);
                                    },
                                    child: FilterCard(
                                      filterImage: filter.filterImage,
                                      filterText: filter.filterText,
                                      isSelected: filter.isSelected,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      );
                    }
                  },
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
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductFetchInProgress) {
                  return Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: SizedBox(
                      height: 190.h,
                      child: const CupertinoActivityIndicator(),
                    ),
                  );
                } else if (state is ProductFetchCompleted) {
                  final state = context.watch<ProductCubit>();
                  return SizedBox(
                    height: 190.h,
                    child: AnimatedList(
                      shrinkWrap: true,
                      key: state.productListKey,
                      initialItemCount: state.products.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index, animation) =>
                          SizeTransition(
                        axis: Axis.horizontal,
                        sizeFactor: animation,
                        child: FadeTransition(
                          opacity: animation,
                          child: Padding(
                            padding: index == 0
                                ? EdgeInsets.only(left: 20.w)
                                : EdgeInsets.zero,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  '/productPage',
                                  arguments: state.products[index],
                                );
                              },
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: ProductCard(
                                  heroTag: state.products[index].uid,
                                  icon: state.products[index].image,
                                  price: state.products[index].price,
                                  title: state.products[index].name,
                                  bgColor: state.products[index].bgColor,
                                  opacity: state.products[index].bgOpacity,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return SizedBox(
                    height: 190.h,
                  );
                }
              },
            )
          ],
        ),
      ],
    );
  }
}
