import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stylish/modules/navigation/cubit/navigation_enum.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(
          const NavigationState(0, 'Home', NavigationItem.home),
        );

  NavigationState currentNavigation =
      const NavigationState(0, 'Home', NavigationItem.home);

  void setNavBarItem(NavigationItem navbarItem) {
    switch (navbarItem) {
      case NavigationItem.home:
        currentNavigation =
            const NavigationState(0, 'Home', NavigationItem.home);
        emit(
          const NavigationState(
            0,
            'Home',
            NavigationItem.home,
          ),
        );
        break;
      case NavigationItem.favourite:
        currentNavigation = const NavigationState(
          1,
          'Favourite',
          NavigationItem.favourite,
        );
        emit(
          const NavigationState(
            1,
            'Favourite',
            NavigationItem.favourite,
          ),
        );
        break;
      case NavigationItem.cart:
        currentNavigation = const NavigationState(
          2,
          'My Cart',
          NavigationItem.cart,
        );
        emit(
          const NavigationState(
            2,
            'My Cart',
            NavigationItem.cart,
          ),
        );
        break;
      case NavigationItem.profile:
        currentNavigation = const NavigationState(
          3,
          'Profile',
          NavigationItem.profile,
        );
        emit(
          const NavigationState(
            3,
            'Profile',
            NavigationItem.profile,
          ),
        );
        break;
    }
  }
}
