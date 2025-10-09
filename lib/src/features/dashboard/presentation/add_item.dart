import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/src/features/items/data/items_provider.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final _itemTitle = TextEditingController();
  final _descriptionTitle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _itemTitle,
                decoration: const InputDecoration(labelText: "Titel"),
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Bitte Titel eingeben'
                    : null,
              ),
              TextFormField(
                controller: _descriptionTitle,
                decoration: const InputDecoration(labelText: "Beschreibung"),
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Bitte Beschreibung eingeben'
                    : null,
              ),

              SizedBox(height: 150),

              FilledButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // add item via provider
                    final title = _itemTitle.text.trim();
                    final desc = _descriptionTitle.text.trim();
                    final quant = 20;
                    context.read<ItemsProvider>().addItem(title, desc, quant);
                    Navigator.of(context).pop();
                  }
                },
                child: const Text("Absenden"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
