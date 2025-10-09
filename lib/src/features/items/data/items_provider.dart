import 'package:flutter/foundation.dart';
import 'package:provider_example/src/features/items/data/item.dart';

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
