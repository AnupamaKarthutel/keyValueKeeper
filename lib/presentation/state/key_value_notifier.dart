import 'package:flutter/material.dart';
import '../../../domain/usecases/add_key_value_usecase.dart';
import '../../../domain/usecases/get_key_values_usecase.dart';
import '../../../domain/entities/key_value.dart';

class KeyValueNotifier extends ChangeNotifier {
  final GetKeyValuesUseCase getKeyValuesUseCase;
  final AddKeyValueUseCase addKeyValueUseCase;

  KeyValueNotifier({
    required this.getKeyValuesUseCase,
    required this.addKeyValueUseCase,
  });

  List<KeyValue> _keyValues = [];
  List<KeyValue> get keyValues => _keyValues;

  Future<void> loadKeyValues() async {
    _keyValues = await getKeyValuesUseCase.call();
    notifyListeners();
  }

  Future<void> addKeyValue(KeyValue keyValue) async {
    await addKeyValueUseCase.call(keyValue);
    await loadKeyValues();
  }
}
