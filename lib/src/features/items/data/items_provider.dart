import 'package:flutter/foundation.dart';

class Item {
  final String title;
  final String description;
  final int quantity;

  Item({
    required this.title,
    required this.description,
    required this.quantity,
  });
}

class ItemsProvider extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => List.unmodifiable(_items);

  int get count => _items.length;

  void addItem(String title, String description, int quantity) {
    _items.add(
      Item(title: title, description: description, quantity: quantity),
    );
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
