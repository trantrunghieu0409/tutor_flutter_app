class BaseReq {
  late int page;
  late int perPage;

  BaseReq({
    this.page = BaseReq.defaultPage,
    this.perPage = defaultPageSize,
  });

  static const int defaultPage = 1;
  static const int defaultPageSize = 10;
}
