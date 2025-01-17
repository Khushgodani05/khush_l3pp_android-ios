class GetTodoRequestModel {
  final int limit;
  final int offset;
  final String query;

  const GetTodoRequestModel({
    this.query = '',
    this.limit = 14,
    this.offset = 0,
  });
}