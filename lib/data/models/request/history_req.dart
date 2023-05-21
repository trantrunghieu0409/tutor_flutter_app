class HistoryReq {
  late int page;
  late int perPage;
  late int? dateTimeGte;
  late int? dateTimeLte;
  late String orderBy;
  late String sortBy;

  HistoryReq({
    this.page = 1,
    this.perPage = 5,
    this.dateTimeGte,
    this.dateTimeLte,
    this.orderBy = 'meeting',
    this.sortBy = 'asc',
  });
}
