import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/src/features/dashboard/presentation/add_item.dart';
import 'package:provider_example/src/features/items/presentation/item_list.dart';
import 'package:provider_example/src/features/items/data/items_provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItemScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ItemListScreen()),
              );
            },
            icon: Builder(
              builder: (context) {
                final count = context
                    .watch<ItemsProvider>()
                    .count; // TODO: Beobachtet den aktuellen Zustand des Providers und aktualisiert die Page bei Änderungen
                return Badge.count(
                  count: count,
                  child: const Icon(Icons.notifications),
                );
              }, // Hier ist ein neues Stückchen code
            ),
          ),
        ],
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                "Willkommen zurück",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Klicke auf das + um einen neuen Task hinzuzufügen",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
