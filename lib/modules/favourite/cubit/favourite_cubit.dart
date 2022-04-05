import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stylish/modules/product/product.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(InitialFavouriteState());

  List<ProductModel> favourites = [];

  void addProductToFavorites(ProductModel product) {
    favourites.add(product);
    emit(AddedFavouriteItem([...favourites]));
  }

  void removeProductFromFavorites(ProductModel product) {
    final foundProduct = favourites.indexOf(product);
    favourites.removeAt(foundProduct);
    emit(RemovedFavouriteItem([...favourites]));
  }
}
