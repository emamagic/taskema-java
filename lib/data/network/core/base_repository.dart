
abstract class BaseRepository<RestProvider> {
  late RestProvider _restProvider;

  BaseRepository({required RestProvider restProvider}) {
    _restProvider = restProvider;
  }

  RestProvider get restProvider => _restProvider;
}

