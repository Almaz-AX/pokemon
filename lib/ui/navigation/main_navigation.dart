import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_test/domain/bloc/guess_pokemon_bloc.dart';
import 'package:pokemon_test/domain/bloc/pokemon_bloc.dart';
import 'package:pokemon_test/ui/widgets/main/main_widget.dart';
import 'package:pokemon_test/ui/widgets/search_pokemon/search_pokemon.dart';

import '../widgets/guess_pokemon/guess_pokemon.dart';
import '../widgets/random_pokemon/random_pokemon.dart';


abstract class MainNavigationRouteNames {
  static const main = '/';
  static const searchPokemon = '/search_pokemon';
  static const randomPokemon = '/random_pokemon';
  static const guessPokemon = '/guess_pokemon';

}

class MainNavigation {
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.main: (context) => const MainWidget(),
    MainNavigationRouteNames.searchPokemon: (context) => BlocProvider<PokemonCubit>(
      create: (context) => PokemonCubit(),
      child: const SearchPokemon(),
      ),
    MainNavigationRouteNames.randomPokemon: (context) => BlocProvider<PokemonCubit>(
      create: (context) => PokemonCubit()..searchPokemon(Random().nextInt(800).toString()),
      child: const RandomPokemon(),
      ),
    MainNavigationRouteNames.guessPokemon: (context) => BlocProvider<GuessPokemonCubit>(
      create: (context) => GuessPokemonCubit()..getPokemons(),
      child: const GuessPokemon(),
      )
  };
}
