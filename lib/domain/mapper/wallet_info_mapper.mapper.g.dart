// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_info_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class WalletInfoMapperImpl extends WalletInfoMapper {
  WalletInfoMapperImpl() : super();

  @override
  WalletInfoEntity fromModel(WalletInfo model) {
    final walletinfoentity = WalletInfoEntity(
      id: model.id,
      userId: model.userId,
      amount: model.amount,
      isBlocked: model.isBlocked,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      bonus: model.bonus,
    );
    return walletinfoentity;
  }
}
