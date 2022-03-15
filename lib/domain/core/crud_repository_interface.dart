abstract class CrudRepositoryInterface<T> {
  Stream<T?> docStream(String id);
  Stream<List<T>> listStream({String? userId, int limit = 20});
  Future<void> add(T model);
  Future<void> update(T model);
  Future<void> delete(T model);
}
