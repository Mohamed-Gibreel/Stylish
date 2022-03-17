import 'dart:convert';

class SideBarItemModel {
  SideBarItemModel({
    required this.title,
    required this.icon,
  });

  factory SideBarItemModel.fromMap(Map<String, dynamic> map) {
    return SideBarItemModel(
      title: map['title'].toString(),
      icon: map['icon'].toString(),
    );
  }

  factory SideBarItemModel.fromJson(String source) =>
      SideBarItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
  String title;
  String icon;

  SideBarItemModel copyWith({
    String? title,
    String? icon,
  }) {
    return SideBarItemModel(
      title: title ?? this.title,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{'title': title, 'icon': icon};

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'SideBarItemModel(title: $title, icon: $icon)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SideBarItemModel &&
        other.title == title &&
        other.icon == icon;
  }

  @override
  int get hashCode => title.hashCode ^ icon.hashCode;
}
