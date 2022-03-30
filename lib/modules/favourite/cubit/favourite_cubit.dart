import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stylish/modules/product/product.dart';

part 'favourite_state.dart';

//TODO: Change [...favourites] to copy with.
class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(InitialFavouriteState());

  List<Product> favourites = [];

  void addProductToFavorites(Product product) {
    favourites.add(product);
    emit(AddedFavouriteItem([...favourites]));
  }

  void removeProductFromFavorites(Product product) {
    final foundProduct = favourites.indexOf(product);
    favourites.removeAt(foundProduct);
    emit(RemovedFavouriteItem([...favourites]));
  }
}
