// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:bloc/bloc.dart';

import '../api_client/api_client.dart';
import '../entity/pokemon.dart';

class PokemonState {
  final String errorText;
  Pokemon? pokemon;
  PokemonState({
    this.errorText = '',
    this.pokemon,
  });

  @override
  bool operator ==(covariant PokemonState other) {
    if (identical(this, other)) return true;

    return other.errorText == errorText && other.pokemon == pokemon;
  }

  @override
  int get hashCode => errorText.hashCode ^ pokemon.hashCode;

  PokemonState copyWith({
    String? errorText,
    Pokemon? pokemon,
  }) {
    return PokemonState(
      errorText: errorText ?? this.errorText,
      pokemon: pokemon ?? this.pokemon,
    );
  }

  @override
  String toString() => 'PokemonState(errorText: $errorText, pokemon: $pokemon)';
}

class PokemonCubit extends Cubit<PokemonState> {
  final _apiClient = ApiClient();

  PokemonCubit() : super(PokemonState());

  Future<void> searchPokemon(String name) async {
    // try {
    //   final newPokemon = await _apiClient.getPokemon(name);
    //   emit(state.copyWith(pokemon: newPokemon, errorText: ''));
    // } catch (e) {
    //   emit(
    //     state.copyWith(
    //         errorText:
    //             'Нет покемона с таким именем, попробуйте снова или введите id',
    //           ),
    //   );
    //     print(e);
      
    // }

    final newPokemon = await _apiClient.getPokemon(name);
    emit(state.copyWith(pokemon: newPokemon, errorText: ''));
  }
}
