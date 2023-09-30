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
import 'package:sqflite/sqflite.dart' as _i3;

import '../blocs/contacts/contacts_bloc.dart' as _i7;
import '../blocs/single_contact/single_contact_bloc.dart' as _i6;
import '../database/sqflite_database.dart' as _i8;
import '../repositories/contacts/contacts_repository.dart' as _i4;
import '../repositories/contacts/sqflite_contacts_repository_impl.dart' as _i5;

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
    final sqfliteDatabase = _$SqfliteDatabase();
    await gh.factoryAsync<_i3.Database>(
      () => sqfliteDatabase.openDb(),
      preResolve: true,
    );
    gh.lazySingleton<_i4.ContactsRepository>(
        () => _i5.SqfliteContactsRepositoryImpl(gh<_i3.Database>()));
    gh.factoryParam<_i6.SingleContactBloc, _i6.SingleContactState, dynamic>((
      initialState,
      _,
    ) =>
        _i6.SingleContactBloc(
          initialState,
          gh<_i4.ContactsRepository>(),
        ));
    gh.singleton<_i7.ContactsBloc>(
        _i7.ContactsBloc(gh<_i4.ContactsRepository>()));
    return this;
  }
}

class _$SqfliteDatabase extends _i8.SqfliteDatabase {}
