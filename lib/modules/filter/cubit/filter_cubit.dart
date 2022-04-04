import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stylish/modules/filter/filter.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterLoadingInProgess()) {
    loadFilters();
  }

  List<FilterModel> filters = [];

  void loadFilters() {
    final rawFilters = [
      {
        'filterImage': 'assets/homepage/dress.svg',
        'filterText': 'Dress',
        'isSelected': false,
        'name': 'dress',
      },
      {
        'filterImage': 'assets/homepage/shirt.svg',
        'filterText': 'Shirt',
        'name': 'shirt',
        'isSelected': false,
      },
      {
        'filterImage': 'assets/homepage/pants.svg',
        'filterText': 'Pants',
        'isSelected': false,
        'name': 'pants'
      },
      {
        'filterImage': 'assets/homepage/t-shirt.svg',
        'filterText': 'T-shirt',
        'isSelected': false,
        'name': 't-shirt'
      },
    ];
    for (final filter in rawFilters) {
      filters.add(FilterModel.fromMap(filter));
    }
    emit(FilterLoadingSuccess());
  }

  void selectFilter(FilterModel selectedFilter) {
    for (final filter in filters) {
      if (filter != selectedFilter) {
        filter.isSelected = false;
      } else {
        filter.isSelected = !filter.isSelected;
      }
    }
    emit(FilterSelected(selectedFilter.copyWith()));
  }
}
