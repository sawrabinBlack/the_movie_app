import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/production_company_vo.dart';
import 'package:movie_app/data/vos/production_country_vo.dart';
import 'package:movie_app/persistance/hive_constants.dart';

part 'movie_vo.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_MOVIE_VO, adapterName: "MovieVOAdapter")
@JsonSerializable()
class MovieVO {
  @JsonKey(name: "adult")
  @HiveField(0)
  bool? adult;

  @JsonKey(name: "backdrop_path")
  @HiveField(1)
  String? backDropPath;

  @JsonKey(name: "genre_ids")
  @HiveField(2)
  List<int>? genreIds;

  @JsonKey(name: "genres")
  @HiveField(3)
  List<GenreVO>? genres;
  @JsonKey(name: "id")
  @HiveField(4)
  int? id;

  @JsonKey(name: "original_language")
  @HiveField(5)
  String? originalLanguage;

  @JsonKey(name: "original_title")
  @HiveField(6)
  String? originalTitle;

  @HiveField(7)
  @JsonKey(name: "overview")
  String? overview;

  @JsonKey(name: "popularity")
  @HiveField(8)
  double? popularity;

  @JsonKey(name: "poster_path")
  @HiveField(9)
  String? posterPath;

  @JsonKey(name: "release_date")
  @HiveField(10)
  String? releaseDate;

  @JsonKey(name: "title")
  @HiveField(11)
  String? title;

  @JsonKey(name: "video")
  @HiveField(12)
  bool? video;

  @JsonKey(name: "vote_average")
  @HiveField(13)
  double? voteAverage;

  @JsonKey(name: "vote_count")
  @HiveField(14)
  int? voteCount;

  @JsonKey(name: "production_companies")
  @HiveField(15)
  List<ProductionCompanyVO>? productionCompanies;

  @JsonKey(name: "production_countries")
  @HiveField(16)
  List<ProductionCountryVO>? productionCountries;

  @JsonKey(name: "runtime")
  @HiveField(17)
  int? runTime;
  @HiveField(18)
  bool? isNowPlaying;
  @HiveField(19)
  bool? isPopular;
  @HiveField(20)
  bool? isTopRated;


  MovieVO(
      this.adult,
      this.backDropPath,
      this.genreIds,
      this.genres,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.productionCompanies,
      this.productionCountries,
      this.runTime,
      this.isNowPlaying,
      this.isPopular,
      this.isTopRated);

  factory MovieVO.fromJson(Map<String, dynamic> json) =>
      _$MovieVOFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVOToJson(this);

  @override
  String toString() {
    return 'MovieVO{adult: $adult, backDropPath: $backDropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount}';
  }

  String getProductionCountryWithCommaSeperate() {
    return productionCountries
            ?.map((country) => country.name ?? "")
            .toList()
            .join(",") ??
        "";
  }

  List<String> getGenreListAsStringList() {
    return genres?.map((genres) => genres.name ?? "").toList() ?? [];
  }

  String getGenreWithCommaSeperate() {
    return getGenreListAsStringList().join(",") ?? "";
  }
}
