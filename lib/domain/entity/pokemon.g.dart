// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      id: json['id'] as int,
      name: json['name'] as String,
      baseExperience: json['base_experience'] as int?,
      height: json['height'] as int,
      isDefault: json['is_default'] as bool,
      abilities: Pokemon._parseAbilities(json['abilities'] as List),
      sprites: PokemonSprites.fromJson(json['sprites'] as Map<String, dynamic>),
      weight: json['weight'] as int,
      forms: Pokemon._parseForms(json['forms'] as List),
      stats: Pokemon._parseStats(json['stats'] as List),
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'base_experience': instance.baseExperience,
      'height': instance.height,
      'weight': instance.weight,
      'is_default': instance.isDefault,
      'abilities': instance.abilities.map((e) => e.toJson()).toList(),
      'sprites': instance.sprites.toJson(),
      'forms': instance.forms.map((e) => e.toJson()).toList(),
      'stats': instance.stats.map((e) => e.toJson()).toList(),
    };

PokemonAbility _$PokemonAbilityFromJson(Map<String, dynamic> json) =>
    PokemonAbility(
      isHidden: json['is_hidden'] as bool,
      slot: json['slot'] as int,
      ability: Ability.fromJson(json['ability'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonAbilityToJson(PokemonAbility instance) =>
    <String, dynamic>{
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
      'ability': instance.ability.toJson(),
    };

Ability _$AbilityFromJson(Map<String, dynamic> json) => Ability(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

PokemonSprites _$PokemonSpritesFromJson(Map<String, dynamic> json) =>
    PokemonSprites(
      backDefault: json['back_default'] as String?,
      backFemale: json['back_female'] as String?,
      backShiny: json['back_shiny'] as String?,
      backShinyFemale: json['back_shiny_female'] as String?,
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'] as String?,
      frontShiny: json['front_shiny'] as String?,
      frontShinyFemale: json['front_shiny_female'] as String?,
      other: Other.fromJson(json['other'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonSpritesToJson(PokemonSprites instance) =>
    <String, dynamic>{
      'back_default': instance.backDefault,
      'back_female': instance.backFemale,
      'back_shiny': instance.backShiny,
      'back_shiny_female': instance.backShinyFemale,
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
      'other': instance.other.toJson(),
    };

Other _$OtherFromJson(Map<String, dynamic> json) => Other(
      officialArtwork: OfficialArtwork.fromJson(
          json['official-artwork'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OtherToJson(Other instance) => <String, dynamic>{
      'official-artwork': instance.officialArtwork.toJson(),
    };

OfficialArtwork _$OfficialArtworkFromJson(Map<String, dynamic> json) =>
    OfficialArtwork(
      frontDefault: json['front_default'] as String,
    );

Map<String, dynamic> _$OfficialArtworkToJson(OfficialArtwork instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
    };

PokemonForms _$PokemonFormsFromJson(Map<String, dynamic> json) => PokemonForms(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PokemonFormsToJson(PokemonForms instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

PokemonStat _$PokemonStatFromJson(Map<String, dynamic> json) => PokemonStat(
      effort: json['effort'] as int,
      stat: json['stat'] as Map<String, dynamic>,
      baseStat: json['base_stat'] as int,
    );

Map<String, dynamic> _$PokemonStatToJson(PokemonStat instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };
