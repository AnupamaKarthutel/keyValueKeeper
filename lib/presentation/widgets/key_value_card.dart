import 'package:flutter/material.dart';
import '../../domain/entities/key_value.dart';

class KeyValueCard extends StatelessWidget {
  final KeyValue keyValue;

  const KeyValueCard({super.key, required this.keyValue});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(keyValue.key),
        subtitle: Text(keyValue.value),
      ),
    );
  }
}
