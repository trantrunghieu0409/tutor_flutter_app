class WalletInfoEntity {
  WalletInfoEntity({
    required this.id,
    required this.userId,
    required this.amount,
    required this.isBlocked,
    required this.createdAt,
    required this.updatedAt,
    required this.bonus,
  });
  late final String id;
  late final String userId;
  late final String amount;
  late final bool isBlocked;
  late final String createdAt;
  late final String updatedAt;
  late final int bonus;
}
