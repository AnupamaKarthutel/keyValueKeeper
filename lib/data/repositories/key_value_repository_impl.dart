import '../../domain/entities/key_value.dart';
import '../../domain/repositories/key_value_repository.dart';
import '../datasources/key_value_local_data_source.dart';
import '../models/key_value_model.dart';

class KeyValueRepositoryImpl implements KeyValueRepository {
  final KeyValueLocalDataSource localDataSource;

  KeyValueRepositoryImpl({required this.localDataSource});

  @override
  Future<void> addKeyValue(KeyValue keyValue) async {
    final model = KeyValueModel(key: keyValue.key, value: keyValue.value);
    await localDataSource.insertKeyValue(model);
  }

  @override
  Future<List<KeyValue>> getKeyValues() async {
    final models = await localDataSource.getKeyValues();
    return models
        .map((model) => KeyValue(key: model.key, value: model.value))
        .toList();
  }
}
