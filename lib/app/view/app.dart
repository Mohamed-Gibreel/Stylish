// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

// import 'package:stylish/counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/authentication/authentication.dart';
import 'package:stylish/l10n/l10n.dart';
import 'package:stylish/modules/checkout/checkout.dart';
import 'package:stylish/modules/favourite/views/favourite.dart';
import 'package:stylish/modules/landingpage/landingpage.dart';
import 'package:stylish/modules/myorders/views/my_orders.dart';
import 'package:stylish/modules/navigation/cubit/navigation_cubit.dart';
import 'package:stylish/modules/onboarding/onboarding.dart';
import 'package:stylish/modules/product/product.dart';
import 'package:stylish/modules/searchpage/searchpage.dart';
import 'package:stylish/modules/settings/settings.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _navigationCubit = NavigationCubit();
    return BlocProvider(
      create: (_) => _navigationCubit,
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
          routes: {
            '/': (context) => const Onboarding(),
            '/secondOnboarding': (context) => const SecondOnboarding(),
            '/thirdOnboarding': (context) => const ThirdOnboarding(),
            '/login': (context) => const LoginScreen(),
            '/signUp': (context) => const SignUpScreen(),
            '/landingPage': (context) => const LandingPage(),
            '/searchPage': (context) => const SearchPage(),
            '/productPage': (context) => const ProductScreen(),
            '/checkout': (context) => const CheckoutScreen(),
            '/completedOrder': (context) => const CompletedOrder(),
            '/settingsPage': (context) => const SettingsScreen(),
            '/myOrdersPage': (context) => const MyOrdersScreen(),
            '/favouritesPage': (context) => const FavouriteScreen(
                  newPage: true,
                ),
          },
        ),
      ),
    );
  }
}
