import '../entities/key_value.dart';

abstract class KeyValueRepository {
  Future<void> addKeyValue(KeyValue keyValue);
  Future<List<KeyValue>> getKeyValues();
}
