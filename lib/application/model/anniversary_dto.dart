import 'package:freezed_annotation/freezed_annotation.dart';

part 'anniversary_dto.freezed.dart';

@freezed
class AnniversaryDto with _$AnniversaryDto {
  const factory AnniversaryDto({
    @Default("") String id,
    required String name,
    required DateTime date,
  }) = _AnniversaryDto;
}
