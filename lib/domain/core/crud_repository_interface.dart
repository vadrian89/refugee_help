abstract class CrudRepositoryInterface<T> {
  Stream<T?> docStream(String id);
  Future<void> add(T model);
  Future<void> update(T model);
  Future<void> delete(T model);
}
