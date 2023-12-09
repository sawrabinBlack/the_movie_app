// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_credits_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCreditsResponse _$GetCreditsResponseFromJson(Map<String, dynamic> json) =>
    GetCreditsResponse(
      json['id'] as int?,
      (json['cast'] as List<dynamic>?)
          ?.map((e) => ActorVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['crew'] as List<dynamic>?)
          ?.map((e) => ActorVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCreditsResponseToJson(GetCreditsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
      'crew': instance.crew,
    };
