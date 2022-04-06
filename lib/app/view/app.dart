import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/l10n/l10n.dart';
import 'package:stylish/modules/authentication/authentication.dart';
import 'package:stylish/modules/cart/cart.dart';
import 'package:stylish/modules/checkout/checkout.dart';
import 'package:stylish/modules/favourite/favourite.dart';
import 'package:stylish/modules/filter/cubit/filter_cubit.dart';
import 'package:stylish/modules/landingpage/landingpage.dart';
import 'package:stylish/modules/myorders/my_orders.dart';
import 'package:stylish/modules/mywallet/mywallet.dart';
import 'package:stylish/modules/navigation/navigation.dart';
import 'package:stylish/modules/onboarding/onboarding.dart';
import 'package:stylish/modules/product/product.dart';
import 'package:stylish/modules/searchpage/searchpage.dart';
import 'package:stylish/modules/settings/settings.dart';
import 'package:stylish/util/page_transition.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _navigationCubit = NavigationCubit();
    final _productsCubit = ProductCubit();
    final _favouritesCubit = FavouriteCubit();
    final _cartCubit = CartCubit();
    final _filterCubit = FilterCubit();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => _navigationCubit,
        ),
        BlocProvider(
          create: (_) => _productsCubit,
        ),
        BlocProvider(
          create: (_) => _favouritesCubit,
        ),
        BlocProvider(
          create: (_) => _cartCubit,
        ),
        BlocProvider(
          create: (_) => _filterCubit,
        ),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(375, 812),
        builder: () => MaterialApp(
          theme: ThemeData(
            fontFamily: 'Gordita',
            scaffoldBackgroundColor: const Color(0xFFFBFBFD),
            appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
            colorScheme: ColorScheme.fromSwatch(
              accentColor: const Color(0xFF13B9FF),
            ),
          ),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/':
                return CustomTransition(const Onboarding());
              case '/secondOnboarding':
                return CustomTransition(const SecondOnboarding());
              case '/thirdOnboarding':
                return CustomTransition(const ThirdOnboarding());
              case '/login':
                return CustomTransition(const LoginScreen());
              case '/signUp':
                return CustomTransition(const SignUpScreen());
              case '/landingPage':
                return CustomTransition(const LandingPage());
              case '/searchPage':
                return CustomTransition(const SearchPage());
              case '/productPage':
                return CustomTransition(
                  ProductScreen(
                    product: settings.arguments! as ProductModel,
                  ),
                );
              case '/checkout':
                return CustomTransition(const CheckoutScreen());
              case '/completedOrder':
                return CustomTransition(const CompletedOrder());
              case '/settingsPage':
                return CustomTransition(const SettingsScreen());
              case '/myOrdersPage':
                return CustomTransition(const MyOrdersScreen());
              case '/favouritesPage':
                return CustomTransition(
                  const FavouriteScreen(
                    newPage: true,
                  ),
                );
              case '/myWalletPage':
                return CustomTransition(const MyWalletScreen());
            }
            return null;
          },
          // routes: {
          // '/': (context) => const Onboarding(),
          // '/secondOnboarding': (context) => const SecondOnboarding(),
          // '/thirdOnboarding': (context) => const ThirdOnboarding(),
          // '/login': (context) => const LoginScreen(),
          // '/signUp': (context) => const SignUpScreen(),
          // '/landingPage': (context) => const LandingPage(),
          // '/searchPage': (context) => const SearchPage(),
          // '/productPage': (context) => const ProductScreen(),
          // '/checkout': (context) => const CheckoutScreen(),
          // '/completedOrder': (context) => const CompletedOrder(),
          // '/settingsPage': (context) => const SettingsScreen(),
          // '/myOrdersPage': (context) => const MyOrdersScreen(),
          // '/favouritesPage': (context) => const FavouriteScreen(
          //       newPage: true,
          //     ),
          // '/myWalletPage': (context) => const MyWalletScreen()
          // },
        ),
      ),
    );
  }
}
