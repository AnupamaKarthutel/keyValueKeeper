import '../repositories/key_value_repository.dart';
import '../entities/key_value.dart';

class GetKeyValuesUseCase {
  final KeyValueRepository repository;

  GetKeyValuesUseCase({required this.repository});

  Future<List<KeyValue>> call() async {
    return await repository.getKeyValues();
  }
}
