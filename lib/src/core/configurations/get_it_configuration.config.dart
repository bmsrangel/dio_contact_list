// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sqflite/sqflite.dart' as _i5;

import '../database/sqflite_database.dart' as _i6;
import '../repositories/contacts/contacts_repository.dart' as _i3;
import '../repositories/contacts/sqflite_contacts_repository_impl.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ContactsRepository>(
        () => _i4.SqfliteContactsRepositoryImpl(gh<_i5.Database>()));
    await gh.singletonAsync<_i6.SqfliteDatabase>(
      () => _i6.SqfliteDatabase.openDb(),
      preResolve: true,
    );
    return this;
  }
}
