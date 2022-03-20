import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/l10n/l10n.dart';
import 'package:stylish/modules/homepage/view/components/bottom_app_bar.dart';
import 'package:stylish/modules/homepage/view/components/custom_app_bar.dart';
import 'package:stylish/modules/homepage/view/components/filter_card.dart';
import 'package:stylish/modules/homepage/view/components/product_card.dart';
import 'package:stylish/modules/homepage/view/components/search_bar.dart';
import 'package:stylish/modules/homepage/view/components/sidebar.dart';
import 'package:stylish/modules/searchpage/searchpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  //Controllers
  late AnimationController animationController;

  //Variables
  bool isCollapsed = false;
  bool showSearchPage = false;
  bool showHomePage = true;
  bool showHomePageText = true;
  bool hideExploreText = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
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
                      Tween<double>(begin: 1, end: .7).animate(
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
                      0.35.w * screenWidth,
                      0.h * screenHeight,
                      -1.2.w * screenWidth,
                      0.h * screenHeight,
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
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (isCollapsed) {
                      animationController.reverse();
                      isCollapsed = !isCollapsed;
                      setState(() {});
                    }
                  },
                  child: IgnorePointer(
                    ignoring: isCollapsed,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: isCollapsed
                            ? <BoxShadow>[
                                BoxShadow(
                                  color: Colors.grey.withOpacity(.15),
                                  blurRadius: 150,
                                )
                              ]
                            : null,
                      ),
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        appBar: CustomAppBar(
                          shape: ContinuousRectangleBorder(
                            borderRadius: isCollapsed
                                ? BorderRadius.only(
                                    topLeft: Radius.circular(30.r),
                                    topRight: Radius.circular(30.r),
                                  )
                                : BorderRadius.zero,
                          ),
                          leadingWidgetCb: () {
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
                          leadingWidgetIcon: Icons.menu,
                        ),
                        body: AnimatedContainer(
                          duration: const Duration(microseconds: 400),
                          decoration: BoxDecoration(
                            borderRadius: isCollapsed
                                ? BorderRadius.only(
                                    bottomLeft: Radius.circular(30.r),
                                    bottomRight: Radius.circular(30.r),
                                  )
                                : BorderRadius.zero,
                            boxShadow: isCollapsed
                                ? <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(.15),
                                      blurRadius: 150,
                                    )
                                  ]
                                : null,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.w,
                                ),
                                child: AnimatedOpacity(
                                  onEnd: () {
                                    showHomePageText = !showHomePageText;
                                    if (mounted) setState(() {});
                                  },
                                  duration: const Duration(milliseconds: 400),
                                  opacity: showHomePage ? 1 : 0,
                                  // visible: showHomePageText,
                                  child: Visibility(
                                    visible: !hideExploreText,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                ),
                              ),
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  Navigator.of(context).push<SearchPage>(
                                    MaterialPageRoute(
                                      builder: (context) => const SearchPage(),
                                    ),
                                  );
                                },
                                child: const IgnorePointer(
                                  child: Hero(
                                    tag: 'search-bar',
                                    child: SearchBar(),
                                  ),
                                ),
                              ),
                              SizedBox(height: 25.h),
                              Visibility(
                                visible: showHomePageText,
                                // visible: !showHomePage,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        FilterCard(
                                          filterImage:
                                              'assets/homepage/dress.svg',
                                          filterText: l10n.dress,
                                        ),
                                        SizedBox(
                                          width: 17.w,
                                        ),
                                        FilterCard(
                                          filterImage:
                                              'assets/homepage/shirt.svg',
                                          filterText: l10n.shirt,
                                        ),
                                        SizedBox(
                                          width: 17.w,
                                        ),
                                        FilterCard(
                                          filterImage:
                                              'assets/homepage/pants.svg',
                                          filterText: l10n.pants,
                                        ),
                                        SizedBox(
                                          width: 17.w,
                                        ),
                                        FilterCard(
                                          filterImage:
                                              'assets/homepage/t-shirt.svg',
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                              color:
                                                  Colors.black.withOpacity(.5),
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
                            ],
                          ),
                        ),
                        extendBody: true,
                        bottomNavigationBar: const CustomBottomAppBar(),
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
