import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';

part 'anniversary_dto.freezed.dart';

@freezed
class AnniversaryDto with _$AnniversaryDto {
  const factory AnniversaryDto({
    @Default("") String id,
    @Default("") String name,
    required DateTime date,
  }) = _AnniversaryDto;
  factory AnniversaryDto.init() {
    return AnniversaryDto(date: DateTime.now());
  }
  factory AnniversaryDto.fromModel(Anniversary model) {
    return AnniversaryDto(
      id: model.id,
      name: model.name,
      date: model.date,
    );
  }
}
