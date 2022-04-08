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
              child: const SearchBar(),
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
                                  child: GestureDetector(
                                    onTap: context.watch<ProductCubit>().state
                                            is ProductFetchInProgress
                                        ? null
                                        : () {
                                            if (filter.isSelected == true) {
                                              BlocProvider.of<ProductCubit>(
                                                context,
                                              ).removeFilter();
                                            } else {
                                              BlocProvider.of<ProductCubit>(
                                                context,
                                              ).filterProducts(filter.name);
                                            }
                                            BlocProvider.of<FilterCubit>(
                                              context,
                                            ).selectFilter(filter);
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
                      child: Row(
                        children: [
                          const ProdcutSkeleton(),
                          SizedBox(
                            width: 10.w,
                          ),
                          const ProdcutSkeleton(),
                          // ProdcutSkeleton(),
                        ],
                      ),
                    ),
                  );
                } else if (state is ProductFetchCompleted) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 190.h,
                        child: AnimatedSwitcher(
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },

                          duration: const Duration(milliseconds: 200),

                          // child: _widgetOptions.elementAt(_selectedIndex)),
                          child: state.products.isEmpty
                              ? const Center(child: Text('No products to show'))
                              : ListView.builder(
                                  itemCount: state.products.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => Padding(
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
                                      child: ProductCard(
                                        product: state.products[index],
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ],
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
