part of './favourite_cubit.dart';

abstract class FavouriteState extends Equatable {}

class InitialFavouriteState extends FavouriteState {
  @override
  List<Object?> get props => [];
}

class AddedFavouriteItem extends FavouriteState {
  AddedFavouriteItem(this.favourites);
  final List<Product> favourites;
  AddedFavouriteItem copyWith({
    required List<Product> favourites,
  }) {
    return AddedFavouriteItem(favourites);
  }

  @override
  List<Object?> get props => [favourites];
}

class RemovedFavouriteItem extends FavouriteState {
  RemovedFavouriteItem(this.favourites);
  RemovedFavouriteItem copyWith({
    required List<Product> favourites,
  }) {
    return RemovedFavouriteItem(favourites);
  }

  final List<Product> favourites;
  @override
  List<Object?> get props => [favourites];
}
