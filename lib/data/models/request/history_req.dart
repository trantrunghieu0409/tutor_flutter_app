class HistoryReq {
  late int page;
  late int perPage;
  late int dateTimeGte;
  late String orderBy;
  late String sortBy;

  HistoryReq(
      {this.page = 1,
      this.perPage = 20,
      required this.dateTimeGte,
      this.orderBy = 'meeting',
      this.sortBy = 'asc'});
}
