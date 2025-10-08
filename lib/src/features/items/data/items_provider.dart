import 'package:flutter/foundation.dart';

class Item {
  final String title;
  final String description;

  Item({required this.title, required this.description});
}

class ItemsProvider extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => List.unmodifiable(_items);

  int get count => _items.length;

  void addItem(String title, String description) {
    _items.add(Item(title: title, description: description));
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
