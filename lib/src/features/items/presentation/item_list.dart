import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/src/features/items/data/items_provider.dart';

class ItemListScreen extends StatefulWidget {
  const ItemListScreen({super.key});

  @override
  State<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  @override
  Widget build(BuildContext context) {
    final items = context.watch<ItemsProvider>().items;

    return Scaffold(
      appBar: AppBar(title: const Text('Items')),

      body: items.isEmpty
          ? const Center(child: Text('Keine Items'))
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.description),
                );
              },
            ), // ein neuer Kommentar
    );
  }
}
