import 'dart:convert';

class FilterModel {
  FilterModel({
    required this.filterImage,
    required this.filterText,
    required this.isSelected,
    required this.name,
  });

  factory FilterModel.fromJson(String source) =>
      FilterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory FilterModel.fromMap(Map<String, dynamic> map) {
    return FilterModel(
      filterImage: (map['filterImage'] ?? '') as String,
      filterText: (map['filterText'] ?? '') as String,
      isSelected: (map['isSelected'] ?? false) as bool,
      name: (map['name'] ?? '') as String,
    );
  }

  String filterImage;
  String filterText;
  bool isSelected;
  String name;

  set selected(bool value) {
    isSelected = value;
  }

  bool get selected {
    return isSelected;
  }

  FilterModel copyWith({
    String? filterImage,
    String? filterText,
    bool? isSelected,
    String? name,
  }) {
    return FilterModel(
      filterImage: filterImage ?? this.filterImage,
      filterText: filterText ?? this.filterText,
      isSelected: isSelected ?? this.isSelected,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{}
      ..addAll(<String, dynamic>{'filterImage': filterImage})
      ..addAll(<String, dynamic>{'filterText': filterText})
      ..addAll(<String, dynamic>{'isSelected': isSelected})
      ..addAll(<String, dynamic>{'name': name});

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'FilterModel(filterImage: $filterImage, filterText: $filterText, isSelected: $isSelected, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FilterModel &&
        other.filterImage == filterImage &&
        other.filterText == filterText &&
        other.isSelected == isSelected &&
        other.name == name;
  }

  @override
  int get hashCode {
    return filterImage.hashCode ^
        filterText.hashCode ^
        isSelected.hashCode ^
        name.hashCode;
  }
}
