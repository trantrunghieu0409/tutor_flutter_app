
import 'package:smartstruct/smartstruct.dart';
import 'package:tutor_flutter_app/data/models/response/login_resp.dart';
import 'package:tutor_flutter_app/domain/entities/authentication/wallet_info_entity.dart';

part 'wallet_info_mapper.mapper.g.dart';

@Mapper()
abstract class WalletInfoMapper {
    WalletInfoEntity fromModel(WalletInfo model);
}