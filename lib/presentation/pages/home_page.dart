import 'package:flutter/material.dart';
import '../widgets/add_key_value_sheet.dart';
import '../widgets/key_value_card.dart';
import '../state/key_value_notifier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Key-Value Manager')),
      body: Consumer<KeyValueNotifier>(
        builder: (context, notifier, child) {
          if (notifier.keyValues.isEmpty) {
            return const Center(child: Text('No key-value pairs found.'));
          }
          return ListView.builder(
            itemCount: notifier.keyValues.length,
            itemBuilder: (context, index) {
              final keyValue = notifier.keyValues[index];
              return KeyValueCard(keyValue: keyValue);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          useSafeArea: true,
          context: context,
          builder: (context) => AddKeyValueSheet(),
          isScrollControlled: true,
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
