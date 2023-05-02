class PastHistoryReq {
  late int page;
  late int perPage;
  late bool isTutor;

  PastHistoryReq({this.page = 1, this.perPage = 20, this.isTutor = false});
}
