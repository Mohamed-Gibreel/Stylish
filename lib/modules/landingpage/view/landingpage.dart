import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/modules/cart/cart.dart';
import 'package:stylish/modules/favourite/favourite.dart';
import 'package:stylish/modules/homepage/homepage.dart';
import 'package:stylish/modules/landingpage/landingpage.dart';
import 'package:stylish/modules/navigation/navigation.dart';
import 'package:stylish/modules/profile/profile.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  //Controllers
  late AnimationController animationController;

  //Variables
  bool isCollapsed = false;

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
                      0.35 * screenWidth,
                      0 * screenHeight,
                      -1.2 * screenWidth,
                      0 * screenHeight,
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
                  // return ScaleTransition(scale: sizeAnimation, child: child);
                },
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (isCollapsed) {
                      animationController.reverse();
                      isCollapsed = !isCollapsed;
                      if (mounted) setState(() {});
                    }
                  },
                  child: IgnorePointer(
                    ignoring: isCollapsed,
                    child: AnimatedContainer(
                      duration: const Duration(microseconds: 400),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: isCollapsed
                            ? BorderRadius.circular(30.r)
                            : BorderRadius.zero,
                        boxShadow: isCollapsed
                            ? <BoxShadow>[
                                BoxShadow(
                                  offset: Offset(-5.w, 100.h),
                                  color: Colors.grey.withOpacity(.15),
                                  blurRadius: 150,
                                )
                              ]
                            : null,
                      ),
                      child: BlocBuilder<NavigationCubit, NavigationState>(
                        builder: (context, state) => Scaffold(
                          backgroundColor: Colors.transparent,
                          appBar: state.navbarItem.name == 'home'
                              ? CustomAppBar(
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
                                  actionButtons: const [NotificationButton()],
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
                                      if (mounted) setState(() {});
                                    }
                                  },
                                  leadingWidgetIcon: Icons.menu,
                                )
                              : CustomAppBar(
                                  title: Text(
                                    state.navBarTitle,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                          body: const [
                            Homepage(),
                            FavouriteScreen(),
                            CartScreen(),
                            ProfileScreen(),
                          ][state.index],
                          extendBody: true,
                          bottomNavigationBar: const CustomBottomAppBar(),
                        ),
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
