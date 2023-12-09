import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/actor_vo.dart';

part 'get_credits_response.g.dart';
@JsonSerializable()
class GetCreditsResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "cast")
  List<ActorVO>? cast;
  @JsonKey(name: "crew")
  List<ActorVO>? crew;

  GetCreditsResponse(this.id, this.cast, this.crew);

  factory GetCreditsResponse.fromJson(Map<String, dynamic> json)=> _$GetCreditsResponseFromJson(json);
  Map<String,dynamic> toJson()=> _$GetCreditsResponseToJson(this);
}