abstract class LoadFromJsonRepository {
  Future<bool> loadFromJson();
}

class LoadFromJsonRepositoryImpl extends LoadFromJsonRepository {
  @override
  Future<bool> loadFromJson() async {
    // return LoadFromJsonDataSource().loadFromJsonAndInsert();
    return false;
  }
}
