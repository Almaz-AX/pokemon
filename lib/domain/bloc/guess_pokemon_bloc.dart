// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../api_client/api_client.dart';
import '../entity/pokemon.dart';

class GuessPokemonState {
  final bool? checkAnswer;
  final List<Pokemon> pokemonList;
  final int counter;
  final int trueAnswersCounter;
  final bool gameProsces;
  final String gameRezult;
  GuessPokemonState({
    this.checkAnswer,
    this.pokemonList = const [],
    this.counter = 0,
    this.trueAnswersCounter = 0,
    this.gameProsces = true,
    this.gameRezult = '',
  });

  GuessPokemonState copyWith({
    bool? checkAnswer,
    List<Pokemon>? pokemonList,
    int? counter,
    int? trueAnswersCounter,
    bool? gameProsces,
    String? gameRezult,
  }) {
    return GuessPokemonState(
      checkAnswer: checkAnswer ?? this.checkAnswer,
      pokemonList: pokemonList ?? this.pokemonList,
      counter: counter ?? this.counter,
      trueAnswersCounter: trueAnswersCounter ?? this.trueAnswersCounter,
      gameProsces: gameProsces ?? this.gameProsces,
      gameRezult: gameRezult ?? this.gameRezult,
    );
  }

  @override
  String toString() {
    return 'GuessPokemonState(checkAnswer: $checkAnswer, pokemonList: $pokemonList, counter: $counter, trueAnswersCounter: $trueAnswersCounter, gameProsces: $gameProsces, gameRezult: $gameRezult)';
  }

  @override
  bool operator ==(covariant GuessPokemonState other) {
    if (identical(this, other)) return true;

    return other.checkAnswer == checkAnswer &&
        listEquals(other.pokemonList, pokemonList) &&
        other.counter == counter &&
        other.trueAnswersCounter == trueAnswersCounter &&
        other.gameProsces == gameProsces &&
        other.gameRezult == gameRezult;
  }

  @override
  int get hashCode {
    return checkAnswer.hashCode ^
        pokemonList.hashCode ^
        counter.hashCode ^
        trueAnswersCounter.hashCode ^
        gameProsces.hashCode ^
        gameRezult.hashCode;
  }
}

class GuessPokemonCubit extends Cubit<GuessPokemonState> {
  final _apiClient = ApiClient();

  GuessPokemonCubit() : super(GuessPokemonState());

  Future<Pokemon> _getPokemon() async {
    final newPokemon =
        await _apiClient.getPokemon(Random().nextInt(1010).toString());
    return newPokemon;
  }

  void _checkGameStatus() {
    if (state.trueAnswersCounter > 5) {
      emit(state.copyWith(gameProsces: false, gameRezult: 'You win)'));
      print('you win');
      return;
    }
    emit(state.copyWith(gameProsces: false, gameRezult: 'You loose)'));
    print('you loose');
  }

  Future<void> getPokemons() async {
    if (state.counter > 9) {
      _checkGameStatus();
      return;
    }

    final pokemonList = <Pokemon>[];
    for (int i = 0; i < 4; i++) {
      final pokemon = await _getPokemon();
      pokemonList.add(pokemon);
    }
    final counter = state.counter;
    emit(state.copyWith(
      pokemonList: pokemonList,
      counter: state.counter + 1,
    ));
  }

  void checkChioce( String pokemonName,) {
    print(state.counter);
    if (pokemonName == state.pokemonList[0].name) {
      state.copyWith(
          trueAnswersCounter: state.trueAnswersCounter + 1, checkAnswer: true);
      return;
    }
    state.copyWith(checkAnswer: false);
  }
}
