import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/movie_vo.dart';
part 'get_now_playing_response.g.dart';
@JsonSerializable()
class GetNowPlayingResponse{

  @JsonKey(name: "page")
  int? page;
  @JsonKey(name:"results")
  List<MovieVO>? results;

  GetNowPlayingResponse(this.page, this.results);

  factory GetNowPlayingResponse.fromJson(Map<String, dynamic> json)=> _$GetNowPlayingResponseFromJson(json);
  Map<String,dynamic> toJson()=> _$GetNowPlayingResponseToJson(this);
}