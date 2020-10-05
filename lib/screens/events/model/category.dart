import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  final int categoryId;
  final String name;
  final IconData icon;

  Category({this.categoryId, this.name, this.icon});
}

final allCategory = Category(
  categoryId: 0,
  name: "All",
  icon: Icons.all_inclusive,
);

final musicCategory = Category(
  categoryId: 1,
  name: "Social",
  icon: Icons.help,
);

final meetUpCategory = Category(
  categoryId: 2,
  name: "Welfare",
  icon: Icons.people,
);

final golfCategory = Category(
  categoryId: 3,
  name: "Education",
  icon: Icons.book,
);

final birthdayCategory = Category(
  categoryId: 4,
  name: "Health",
  icon: Icons.local_hospital,
);

final categories = [
  allCategory,
  musicCategory,
  meetUpCategory,
  golfCategory,
  birthdayCategory,
];
