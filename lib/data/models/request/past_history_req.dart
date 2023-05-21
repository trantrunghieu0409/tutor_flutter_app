class PastHistoryReq {
  late int page;
  late int perPage;
  late bool isTutor;

  PastHistoryReq({this.page = 1, this.perPage = 10, this.isTutor = false});
}
