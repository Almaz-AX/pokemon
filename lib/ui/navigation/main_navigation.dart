import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_test/domain/bloc/pokemon_bloc.dart';
import 'package:pokemon_test/ui/widgets/main/main_widget.dart';
import 'package:pokemon_test/ui/widgets/search_pokemon/search_pokemon.dart';

import '../widgets/random_pokemon/random_pokemon.dart';


abstract class MainNavigationRouteNames {
  static const main = '/';
  static const searchPokemon = '/search_pokemon';
  static const randomPokemon = '/random_pokemon';

}

class MainNavigation {
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.main: (context) => const MainWidget(),
    MainNavigationRouteNames.searchPokemon: (context) => BlocProvider<PokemonCubit>(
      create: (context) => PokemonCubit(),
      child: const SearchPokemon(),
      ),
    MainNavigationRouteNames.randomPokemon: (context) => BlocProvider<PokemonCubit>(
      create: (context) => PokemonCubit(),
      child: const RandomPokemon(),
      )
  };
}
