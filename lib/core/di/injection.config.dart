// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bloc_2/core/di/register_module.dart' as _i148;
import 'package:bloc_2/data/clients/todo_client.dart' as _i257;
import 'package:bloc_2/data/data.dart' as _i197;
import 'package:bloc_2/domain/domain.dart' as _i289;
import 'package:bloc_2/domain/todo_repository.dart' as _i546;
import 'package:bloc_2/presentation/bloc/todo_bloc.dart' as _i672;
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i519.Client>(() => registerModule.httpClient);
    gh.lazySingleton<_i257.IClient>(() => _i257.TodoClient(gh<_i519.Client>()));
    gh.lazySingleton<_i546.ITodoRepository>(
        () => _i546.TodoRepository(gh<_i197.IClient>()));
    gh.factory<_i672.TodoBloc>(
        () => _i672.TodoBloc(todoRepository: gh<_i289.ITodoRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i148.RegisterModule {}
