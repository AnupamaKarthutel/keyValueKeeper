import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/state/key_value_notifier.dart';
import 'data/datasources/key_value_local_data_source.dart';
import 'data/repositories/key_value_repository_impl.dart';
import 'domain/usecases/add_key_value_usecase.dart';
import 'domain/usecases/get_key_values_usecase.dart';

void main() {
  final keyValueLocalDataSource = KeyValueLocalDataSource();
  final keyValueRepository =
      KeyValueRepositoryImpl(localDataSource: keyValueLocalDataSource);

  final addKeyValueUseCase = AddKeyValueUseCase(repository: keyValueRepository);
  final getKeyValuesUseCase =
      GetKeyValuesUseCase(repository: keyValueRepository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => KeyValueNotifier(
            getKeyValuesUseCase: getKeyValuesUseCase,
            addKeyValueUseCase: addKeyValueUseCase,
          )..loadKeyValues(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Key-Value Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
