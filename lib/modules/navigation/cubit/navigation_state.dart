part of './navigation_cubit.dart';

class NavigationState extends Equatable {
  const NavigationState(
    this.index,
    this.navBarTitle,
    this.navbarItem,
  );
  final NavigationItem navbarItem;
  final String navBarTitle;
  final int index;

  @override
  List<Object> get props => [navbarItem, index, navBarTitle];
}
