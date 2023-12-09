import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/persistance/hive_constants.dart';

class GenreDao {
  static final GenreDao _singleton = GenreDao._internal();

  factory GenreDao() {
    return _singleton;
  }

  GenreDao._internal();

  void saveAllGenre(List<GenreVO> genreList) {
    Map<int, GenreVO> genreMap = Map.fromIterable(genreList,
        key: (genre) => genre.id, value: (genre) => genre);
    getGenreBox().putAll(genreMap);
  }

  List<GenreVO> getAllGenre() {
    return getGenreBox().values.toList();
  }

  Box<GenreVO> getGenreBox() {
    return Hive.box(BOX_NAME_GENRE_VO);
  }
}
