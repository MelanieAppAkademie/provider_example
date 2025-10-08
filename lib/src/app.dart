import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/src/features/dashboard/presentation/dashboard_screen.dart';
import 'package:provider_example/src/features/items/data/items_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ItemsProvider())],
      child: const MaterialApp(home: DashboardScreen()),
    );
  }
}
