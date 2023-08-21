
import 'package:json_annotation/json_annotation.dart';
part 'actor_vo.g.dart';
@JsonSerializable()
class ActorVO{
  @JsonKey(name: "adult")
  bool? adult;
  @JsonKey(name: "gender")
  int? gender;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "profile_path")
  String? profilePath;

  ActorVO(this.adult, this.gender, this.id, this.name, this.profilePath);


  factory ActorVO.fromJson(Map<String, dynamic> json)=> _$ActorVOFromJson(json);
  Map<String,dynamic> toJson()=> _$ActorVOToJson(this);

}