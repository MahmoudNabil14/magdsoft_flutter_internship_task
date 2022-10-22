abstract class ApiConsumer {
  Future get({required String path, Map<String, dynamic>? queryParameters});

  Future post(
      {required String path,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters});
}
