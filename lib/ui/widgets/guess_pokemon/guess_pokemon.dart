import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/bloc/guess_pokemon_bloc.dart';

class GuessPokemon extends StatelessWidget {
  const GuessPokemon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Search pokemon')),
        body: const _GuessPokemon());
  }
}

class _GuessPokemon extends StatelessWidget {
  const _GuessPokemon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: const [
          _GuessPokemonPhoto(),
          _AnswersVarinat(),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}

class _AnswersVarinat extends StatelessWidget {
  const _AnswersVarinat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GuessPokemonCubit, GuessPokemonState>(
        builder: (context, state) {
      final pokemons = state.pokemonList;

      if (pokemons.isEmpty) {
        return const Placeholder();
      }

      final cubit = context.read<GuessPokemonCubit>();
      final List<String> pokemonNameList = [];
      for (var pokemon in pokemons) {
        pokemonNameList.add(pokemon.name);
      }
      pokemonNameList.shuffle();

      return Column(children: [
        SizedBox(
          width: 200,
          child: ElevatedButton(
              onPressed: () async {
                cubit.checkChioce(pokemonNameList[0]);
                await cubit.getPokemons();
              },
              child: Text(pokemonNameList[0].toUpperCase())),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 200,
          child: ElevatedButton(
              onPressed: () async {
                cubit.checkChioce(pokemonNameList[1]);
                await cubit.getPokemons();
              },
              child: Text(pokemonNameList[1].toUpperCase())),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 200,
          child: ElevatedButton(
              onPressed: () async {
                cubit.checkChioce(pokemonNameList[2]);
                await cubit.getPokemons();
              },
              child: Text(pokemonNameList[2].toUpperCase())),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 200,
          child: ElevatedButton(
              onPressed: () async {
                cubit.checkChioce(pokemonNameList[3]);
                await cubit.getPokemons();
              },
              child: Text(pokemonNameList[3].toUpperCase())),
        ),
      ]);
    });
  }
}

class _GuessPokemonPhoto extends StatelessWidget {
  const _GuessPokemonPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GuessPokemonCubit, GuessPokemonState>(
        builder: (context, state) {
      final pokemons = state.pokemonList;
      if (pokemons.isEmpty) {
        return const Placeholder();
      }
      return Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 350,
            child: Image.network(
              pokemons[0].sprites.other.officialArtwork.frontDefault,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
