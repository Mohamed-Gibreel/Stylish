part of './favourite_cubit.dart';

abstract class FavouriteState extends Equatable {}

class InitialFavouriteState extends FavouriteState {
  @override
  List<Object?> get props => [];
}

class AddedFavouriteItem extends FavouriteState {
  AddedFavouriteItem(this.favourites);
  final List<ProductModel> favourites;
  AddedFavouriteItem copyWith({
    required List<ProductModel> favourites,
  }) {
    return AddedFavouriteItem(favourites);
  }

  @override
  List<Object?> get props => [favourites];
}

class RemovedFavouriteItem extends FavouriteState {
  RemovedFavouriteItem(this.favourites);
  RemovedFavouriteItem copyWith({
    required List<ProductModel> favourites,
  }) {
    return RemovedFavouriteItem(favourites);
  }

  final List<ProductModel> favourites;
  @override
  List<Object?> get props => [favourites];
}
