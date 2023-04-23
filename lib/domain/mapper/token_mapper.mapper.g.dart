// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class TokenMapperImpl extends TokenMapper {
  TokenMapperImpl() : super();

  @override
  TokenEntity fromAccessModel(Access model) {
    final tokenentity = TokenEntity(
      token: model.token,
      expires: model.expires,
    );
    return tokenentity;
  }

  @override
  TokenEntity fromRefreshModel(Refresh model) {
    final tokenentity = TokenEntity(
      token: model.token,
      expires: model.expires,
    );
    return tokenentity;
  }
}
