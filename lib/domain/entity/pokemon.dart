// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Pokemon {
  final int id;
  final String name;
  final int? baseExperience;
  final int height;
  final int weight;
  final bool isDefault;
  @JsonKey(name: 'abilities', fromJson: _parseAbilities)
  final List<PokemonAbility> abilities;
  final PokemonSprites sprites;
  @JsonKey(name: 'forms', fromJson: _parseForms)
  final List<PokemonForms> forms;
  @JsonKey(name: 'stats', fromJson: _parseStats)
  final List<PokemonStat> stats;
  // @JsonKey(name: 'types', fromJson: _parseTypes)
  // final List<PokemonType> types;

  Pokemon({
    required this.id,
    required this.name,
    this.baseExperience,
    required this.height,
    required this.isDefault,
    required this.abilities,
    required this.sprites,
    required this.weight,
    required this.forms,
    required this.stats,
    // required this.types
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  static List<PokemonAbility> _parseAbilities(List<dynamic> list) {
    final rez = list
        .map((e) => PokemonAbility.fromJson(e as Map<String, dynamic>))
        .toList();
    return rez;
  }

  static List<PokemonForms> _parseForms(List<dynamic> list) {
    final rez = list
        .map((e) => PokemonForms.fromJson(e as Map<String, dynamic>))
        .toList();
    return rez;
  }

  static List<PokemonStat> _parseStats(List<dynamic> list) {
    final rez = list
        .map((e) => PokemonStat.fromJson(e as Map<String, dynamic>))
        .toList();
    return rez;
  }

  // static List<PokemonType> _parseTypes(List<dynamic> list) {
  //   final rez = list
  //       .map((e) => PokemonType.fromJson(e as Map<String, dynamic>))
  //       .toList();
  //   return rez;
  // }
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PokemonAbility {
  final bool isHidden;
  final int slot;
  final Ability ability;

  PokemonAbility({
    required this.isHidden,
    required this.slot,
    required this.ability,
  });

  factory PokemonAbility.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonAbilityToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Ability {
  final String name;
  final String url;
  Ability({required this.name, required this.url});
  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PokemonSprites {
  final String? backDefault;
  final String? backFemale;
  final String? backShiny;
  final String? backShinyFemale;
  final String? frontDefault;
  final String? frontFemale;
  final String? frontShiny;
  final String? frontShinyFemale;
  final Other other;

  PokemonSprites(
      {required this.backDefault,
      this.backFemale,
      required this.backShiny,
      this.backShinyFemale,
      required this.frontDefault,
      this.frontFemale,
      required this.frontShiny,
      this.frontShinyFemale,
      required this.other});

  factory PokemonSprites.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpritesToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.kebab)
class Other {
  final OfficialArtwork officialArtwork;
  Other({
    required this.officialArtwork,
  });

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);

  Map<String, dynamic> toJson() => _$OtherToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class OfficialArtwork {
  final String frontDefault;
  OfficialArtwork({
    required this.frontDefault,
  });

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      _$OfficialArtworkFromJson(json);

  Map<String, dynamic> toJson() => _$OfficialArtworkToJson(this);
}

@JsonSerializable()
class PokemonForms {
  final String name;
  final String url;

  PokemonForms({required this.name, required this.url});

  factory PokemonForms.fromJson(Map<String, dynamic> json) =>
      _$PokemonFormsFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonFormsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonStat {
  final int baseStat;
  final int effort;
  final Map stat;

  PokemonStat({required this.effort, required this.stat, required this.baseStat,});

  factory PokemonStat.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonStatToJson(this);
}

// @JsonSerializable()
// class PokemonType{
//   final String name;
//   final String url;

//   PokemonType({required this.name, required this.url});

//   factory PokemonType.fromJson(Map<String, dynamic> json) =>
//       _$PokemonTypeFromJson(json);

//   Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);

// }
