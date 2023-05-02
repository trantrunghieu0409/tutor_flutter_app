class WalletInfoEntity {
  WalletInfoEntity({
    required this.amount,
    required this.isBlocked,
    required this.bonus,
  });
  late final String amount;
  late final bool isBlocked;
  late final int bonus;
}
