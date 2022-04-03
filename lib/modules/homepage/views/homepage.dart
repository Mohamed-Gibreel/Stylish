import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/l10n/l10n.dart';
import 'package:stylish/modules/landingpage/landingpage.dart';
import 'package:stylish/modules/product/cubit/product_cubit.dart';
import 'package:stylish/modules/product/product.dart';

class FilterOptions {
  FilterOptions(this.filter, this.filterType, {required this.isSelected});
  FilterCard filter;
  String filterType;
  bool isSelected;

  set selected(bool value) {
    isSelected = value;
  }

  bool get selected {
    return isSelected;
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late List<FilterOptions> _filterOptions;
  late List<ProductModel> filteredProducts;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final l10n = context.l10n;
    print("did change");
    _filterOptions = [
      FilterOptions(
        FilterCard(
          filterImage: 'assets/homepage/dress.svg',
          filterText: l10n.dress,
          isSelected: false,
        ),
        'dress',
        isSelected: false,
      ),
      FilterOptions(
        FilterCard(
          filterImage: 'assets/homepage/shirt.svg',
          filterText: l10n.shirt,
          isSelected: false,
        ),
        'shirt',
        isSelected: false,
      ),
      FilterOptions(
        FilterCard(
          filterImage: 'assets/homepage/pants.svg',
          filterText: l10n.pants,
          isSelected: false,
        ),
        'pants',
        isSelected: false,
      ),
      FilterOptions(
        FilterCard(
          filterImage: 'assets/homepage/t-shirt.svg',
          filterText: l10n.tShirt,
          isSelected: false,
        ),
        't-shirt',
        isSelected: false,
      )
    ];
    filteredProducts = BlocProvider.of<ProductCubit>(context).products;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("build called");
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
                ..._filterOptions
                    .map(
                      (filter) => Row(
                        children: [
                          Material(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(15.r),
                              splashColor: Colors.transparent,
                              onTap: () {
                                final listWithoutSelected =
                                    _filterOptions.where((f) => f != filter);
                                for (final filter in listWithoutSelected) {
                                  filter.selected = false;
                                }
                                if (filter.selected == true) {
                                  BlocProvider.of<ProductCubit>(context)
                                      .removeFilter();
                                } else {
                                  BlocProvider.of<ProductCubit>(context)
                                      .filterProducts(filter.filterType);
                                }
                                filter.selected = !filter.selected;
                                if (mounted) setState(() {});
                              },
                              child: FilterCard(
                                filterImage: filter.filter.filterImage,
                                filterText: filter.filter.filterText,
                                isSelected: filter.selected,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 17.w,
                          )
                        ],
                      ),
                    )
                    .toList()
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
