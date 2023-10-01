// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_cropper/image_cropper.dart' as _i4;
import 'package:image_picker/image_picker.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sqflite/sqflite.dart' as _i3;

import '../../app_module.dart' as _i16;
import '../../pages/edit_contact_page/edit_contact_controller.dart' as _i12;
import '../blocs/contacts/contacts_bloc.dart' as _i14;
import '../blocs/single_contact/single_contact_bloc.dart' as _i13;
import '../database/sqflite_database.dart' as _i15;
import '../repositories/contacts/contacts_repository.dart' as _i8;
import '../repositories/contacts/sqflite_contacts_repository_impl.dart' as _i9;
import '../services/contacts_service/contacts_service.dart' as _i10;
import '../services/contacts_service/contacts_service_impl.dart' as _i11;
import '../services/image_service/image_picker_image_service_impl.dart' as _i7;
import '../services/image_service/image_service.dart' as _i6;

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
    final appModule = _$AppModule();
    await gh.factoryAsync<_i3.Database>(
      () => sqfliteDatabase.openDb(),
      preResolve: true,
    );
    gh.lazySingleton<_i4.ImageCropper>(() => appModule.imageCropper);
    gh.lazySingleton<_i5.ImagePicker>(() => appModule.imagePicker);
    gh.lazySingleton<_i6.ImageService>(() => _i7.ImagePickerImageServiceImpl(
          gh<_i5.ImagePicker>(),
          gh<_i4.ImageCropper>(),
        ));
    gh.lazySingleton<_i8.ContactsRepository>(
        () => _i9.SqfliteContactsRepositoryImpl(gh<_i3.Database>()));
    gh.lazySingleton<_i10.ContactsService>(() => _i11.ContactsServiceImpl(
          gh<_i8.ContactsRepository>(),
          gh<_i6.ImageService>(),
        ));
    gh.factory<_i12.EditContactController>(
        () => _i12.EditContactController(gh<_i6.ImageService>()));
    gh.factoryParam<_i13.SingleContactBloc, _i13.SingleContactState, dynamic>((
      initialState,
      _,
    ) =>
        _i13.SingleContactBloc(
          initialState,
          gh<_i10.ContactsService>(),
        ));
    gh.singleton<_i14.ContactsBloc>(
        _i14.ContactsBloc(gh<_i10.ContactsService>()));
    return this;
  }
}

class _$SqfliteDatabase extends _i15.SqfliteDatabase {}

class _$AppModule extends _i16.AppModule {}
