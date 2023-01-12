import 'dart:convert';

QuranModel? quranModelFromJson(String str) =>
    QuranModel.fromJson(json.decode(str));

String quranModelToJson(QuranModel? data) => json.encode(data!.toJson());

class QuranModel {
  QuranModel({
    this.search,
  });

  Search? search;

  QuranModel copyWith({
    Search? search,
  }) =>
      QuranModel(
        search: search ?? this.search,
      );

  factory QuranModel.fromJson(Map<String, dynamic> json) => QuranModel(
        search: Search.fromJson(json["search"]),
      );

  Map<String, dynamic> toJson() => {
        "search": search!.toJson(),
      };
}

class Search {
  Search({
    this.query,
    this.totalResults,
    this.currentPage,
    this.totalPages,
    this.results,
  });

  String? query;
  int? totalResults;
  int? currentPage;
  int? totalPages;
  List<Result?>? results;

  Search copyWith({
    String? query,
    int? totalResults,
    int? currentPage,
    int? totalPages,
    List<Result?>? results,
  }) =>
      Search(
        query: query ?? this.query,
        totalResults: totalResults ?? this.totalResults,
        currentPage: currentPage ?? this.currentPage,
        totalPages: totalPages ?? this.totalPages,
        results: results ?? this.results,
      );

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        query: json["query"],
        totalResults: json["total_results"],
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
        results: json["results"] == null
            ? []
            : List<Result?>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "query": query,
        "total_results": totalResults,
        "current_page": currentPage,
        "total_pages": totalPages,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x!.toJson())),
      };
}

class Result {
  Result({
    this.verseKey,
    this.verseId,
    this.text,
    this.highlighted,
    this.words,
    this.translations,
  });

  String? verseKey;
  int? verseId;
  String? text;
  dynamic highlighted;
  List<Word?>? words;
  List<Translation?>? translations;

  Result copyWith({
    String? verseKey,
    int? verseId,
    String? text,
    dynamic highlighted,
    List<Word?>? words,
    List<Translation?>? translations,
  }) =>
      Result(
        verseKey: verseKey ?? this.verseKey,
        verseId: verseId ?? this.verseId,
        text: text ?? this.text,
        highlighted: highlighted ?? this.highlighted,
        words: words ?? this.words,
        translations: translations ?? this.translations,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        verseKey: json["verse_key"],
        verseId: json["verse_id"],
        text: json["text"],
        highlighted: json["highlighted"],
        words: json["words"] == null
            ? []
            : List<Word?>.from(json["words"]!.map((x) => Word.fromJson(x))),
        translations: json["translations"] == null
            ? []
            : List<Translation?>.from(
                json["translations"]!.map((x) => Translation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "verse_key": verseKey,
        "verse_id": verseId,
        "text": text,
        "highlighted": highlighted,
        "words": words == null
            ? []
            : List<dynamic>.from(words!.map((x) => x!.toJson())),
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x!.toJson())),
      };
}

class Translation {
  Translation({
    this.text,
    this.resourceId,
    this.name,
    this.languageName,
  });

  String? text;
  int? resourceId;
  Name? name;
  LanguageName? languageName;

  Translation copyWith({
    String? text,
    int? resourceId,
    Name? name,
    LanguageName? languageName,
  }) =>
      Translation(
        text: text ?? this.text,
        resourceId: resourceId ?? this.resourceId,
        name: name ?? this.name,
        languageName: languageName ?? this.languageName,
      );

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        text: json["text"],
        resourceId: json["resource_id"],
        name: nameValues.map[json["name"]],
        languageName: languageNameValues.map[json["language_name"]],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "resource_id": resourceId,
        "name": nameValues.reverse![name],
        "language_name": languageNameValues.reverse![languageName],
      };
}

enum LanguageName { ENGLISH }

final languageNameValues = EnumValues({"english": LanguageName.ENGLISH});

enum Name {
  DR_T_B_IRVING,
  MUHAMMAD_TAQI_UD_DIN_AL_HILALI_MUHAMMAD_MUHSIN_KHAN,
  DR_MUSTAFA_KHATTAB_THE_CLEAR_QURAN,
  ABDUL_HALEEM
}

final nameValues = EnumValues({
  "Abdul Haleem": Name.ABDUL_HALEEM,
  "Dr. Mustafa Khattab, the Clear Quran":
      Name.DR_MUSTAFA_KHATTAB_THE_CLEAR_QURAN,
  "Dr. T. B. Irving": Name.DR_T_B_IRVING,
  "Muhammad Taqi-ud-Din al-Hilali & Muhammad Muhsin Khan":
      Name.MUHAMMAD_TAQI_UD_DIN_AL_HILALI_MUHAMMAD_MUHSIN_KHAN
});

class Word {
  Word({
    this.charType,
    this.text,
  });

  CharType? charType;
  String? text;

  Word copyWith({
    CharType? charType,
    String? text,
  }) =>
      Word(
        charType: charType ?? this.charType,
        text: text ?? this.text,
      );

  factory Word.fromJson(Map<String, dynamic> json) => Word(
        charType: charTypeValues.map[json["char_type"]],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "char_type": charTypeValues.reverse![charType],
        "text": text,
      };
}

enum CharType { WORD, END }

final charTypeValues = EnumValues({"end": CharType.END, "word": CharType.WORD});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
