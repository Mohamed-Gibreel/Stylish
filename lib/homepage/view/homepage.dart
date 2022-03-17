import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish/homepage/view/components/bottom_app_bar.dart';
import 'package:stylish/homepage/view/components/filter_card.dart';
import 'package:stylish/homepage/view/components/product_card.dart';
import 'package:stylish/homepage/view/components/sidebar.dart';
import 'package:stylish/l10n/l10n.dart';
import 'package:stylish/util/constants.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool isCollapsed = false;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          bottom: false,
          child: Stack(
            fit: StackFit.expand,
            children: [
              const Sidebar(),
              AnimatedBuilder(
                animation: animationController,
                builder: (context, child) {
                  final sizeAnimation =
                      Tween<double>(begin: 1, end: .8).animate(
                    CurvedAnimation(
                      parent: animationController,
                      curve: Curves.easeIn,
                    ),
                  );
                  final screenWidth = MediaQuery.of(context).size.width;
                  final screenHeight = MediaQuery.of(context).size.height;
                  final positonAnimation = RelativeRectTween(
                    begin: RelativeRect.fill,
                    end: RelativeRect.fromLTRB(
                      0.5 * screenWidth,
                      0.05 * screenHeight,
                      -1.2 * screenWidth,
                      -0 * screenHeight,
                    ),
                  ).animate(
                    CurvedAnimation(
                      parent: animationController,
                      curve: Curves.easeIn,
                    ),
                  );
                  return PositionedTransition(
                    rect: positonAnimation,
                    child: ScaleTransition(scale: sizeAnimation, child: child),
                  );
                },
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    elevation: 0,
                    leadingWidth: 38.w,
                    leading: GestureDetector(
                      onTap: () {
                        if (mounted) {
                          if (isCollapsed) {
                            animationController.reverse();
                          } else {
                            animationController.forward();
                          }
                          isCollapsed = !isCollapsed;
                          setState(() {});
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: const Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.black,
                          size: 16.h,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          'Abu Dhabi',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        )
                      ],
                    ),
                    actions: [
                      Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: Align(
                          child: Container(
                            width: 42.w,
                            height: 38.h,
                            decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.grey.withOpacity(.1),
                                  blurRadius: 1,
                                )
                              ],
                              borderRadius: BorderRadius.circular(5.r),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Stack(
                                children: [
                                  const Icon(
                                    Icons.notifications,
                                    color: Colors.grey,
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      width: 10.w,
                                      height: 10.h,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 2.w,
                                        vertical: 2.h,
                                      ),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Container(
                                        constraints: BoxConstraints(
                                          maxHeight: 1.h,
                                          maxWidth: 1.w,
                                        ),
                                        decoration: const BoxDecoration(
                                          color: Constants.primaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  extendBodyBehindAppBar: true,
                  extendBody: true,
                  bottomNavigationBar: const CustomBottomAppBar(),
                  body: SingleChildScrollView(
                    child: AnimatedContainer(
                      duration: const Duration(microseconds: 300),
                      decoration: BoxDecoration(
                        color: isCollapsed
                            ? Colors.white
                            : const Color(0xFFFBFBFD),
                        borderRadius: isCollapsed
                            ? BorderRadius.circular(20.r)
                            : BorderRadius.zero,
                        boxShadow: isCollapsed
                            ? <BoxShadow>[
                                BoxShadow(
                                  color: Colors.grey.withOpacity(.15),
                                  blurRadius: 150,
                                )
                              ]
                            : null,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.w,
                              right: 20.w,
                              top: 35.h,
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
                                Container(
                                  width: double.infinity,
                                  height: 55.h,
                                  padding: EdgeInsets.only(left: 20.w),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          textAlign: TextAlign.left,
                                          cursorHeight: 15.h,
                                          decoration: InputDecoration(
                                            hintStyle: TextStyle(height: 1.4.h),
                                            focusColor: Colors.red,
                                            prefixIcon:
                                                const Icon(Icons.search),
                                            hintText: l10n.searchItems,
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Container(
                                        width: 47.w,
                                        height: 43.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          color: Constants.primaryColor,
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset(
                                            'assets/homepage/filter.svg',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 25.h),
                              ],
                            ),
                          ),
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
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                                const ProductCard(
                                  icon: 'assets/products/shirt-1.png',
                                  price: 265,
                                  title: 'Long Sleeve Shirts',
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
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
