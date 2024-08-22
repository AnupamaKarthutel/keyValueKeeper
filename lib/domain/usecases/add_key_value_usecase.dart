import '../repositories/key_value_repository.dart';
import '../entities/key_value.dart';

class AddKeyValueUseCase {
  final KeyValueRepository repository;

  AddKeyValueUseCase({required this.repository});

  Future<void> call(KeyValue keyValue) async {
    await repository.addKeyValue(keyValue);
  }
}
