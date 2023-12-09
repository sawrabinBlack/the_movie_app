
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/persistance/hive_constants.dart';
part 'actor_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_ACTOR_VO,adapterName: "ActorVOAdapter")
class ActorVO{
  @JsonKey(name: "adult")
  @HiveField(0)
  bool? adult;

  @JsonKey(name: "gender")
  @HiveField(1)
  int? gender;

  @JsonKey(name: "id")
  @HiveField(2)
  int? id;
  @JsonKey(name: "name")
  @HiveField(3)
  String? name;

  @HiveField(4)
  @JsonKey(name: "profile_path")
  String? profilePath;

  ActorVO(this.adult, this.gender, this.id, this.name, this.profilePath);
  @override
  String toString() {
    return 'ActorVO{adult: $adult, gender: $gender, id: $id, name: $name, profilePath: $profilePath}';
  }

  factory ActorVO.fromJson(Map<String, dynamic> json)=> _$ActorVOFromJson(json);
  Map<String,dynamic> toJson()=> _$ActorVOToJson(this);

}