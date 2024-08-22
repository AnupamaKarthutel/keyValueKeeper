import 'package:flutter/material.dart';
import '../../domain/entities/key_value.dart';
import '../state/key_value_notifier.dart';
import 'package:provider/provider.dart';

class AddKeyValueSheet extends StatelessWidget {
  final TextEditingController _keyController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  AddKeyValueSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _keyController,
            decoration: const InputDecoration(labelText: 'Key'),
          ),
          TextField(
            controller: _valueController,
            decoration: const InputDecoration(labelText: 'Value'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  final key = _keyController.text;
                  final value = _valueController.text;
                  if (key.isNotEmpty && value.isNotEmpty) {
                    final keyValue = KeyValue(key: key, value: value);
                    context.read<KeyValueNotifier>().addKeyValue(keyValue);
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Save'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
