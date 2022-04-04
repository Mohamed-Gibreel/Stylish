part of './filter_cubit.dart';

abstract class FilterState extends Equatable {}

class FilterLoadingInProgess extends FilterState {
  @override
  List<Object?> get props => [];
}

class FilterLoadingSuccess extends FilterState {
  @override
  List<Object?> get props => [];
}

class FilterLoadingLoaded extends FilterState {
  @override
  List<Object?> get props => [];
}

class FilterSelected extends FilterState {
  FilterSelected(this.filter);
  final FilterModel? filter;

  FilterSelected copyWith({
    FilterModel? filter,
  }) {
    return FilterSelected(
      filter ?? this.filter,
    );
  }

  @override
  List<Object?> get props => [filter];
}
