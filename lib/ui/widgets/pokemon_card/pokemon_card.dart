import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/bloc/pokemon_bloc.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonCubit, PokemonState>(builder: (context, state) {
      final pokemon = state.pokemon;
      if (pokemon == null) {
        return Text(state.errorText, style: const TextStyle(color: Colors.red),);
      }
      return Column(
        children: [
          if (state.errorText.isNotEmpty) Text(state.errorText, style: const TextStyle(color: Colors.red),),
          Text(
            pokemon.name.toUpperCase(),
            style: const TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(children: [
            Text('Weight: ${pokemon.weight} hg'),
            const Expanded(child: SizedBox()),
            Text('Height: ${pokemon.weight} dm')
          ]),
          
          SizedBox(width: double.infinity, height: 350,
            child: Image.network(
              pokemon.sprites.other.officialArtwork.frontDefault,
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
          Row(children: [
            Text('Base experience: ${pokemon.baseExperience}'),
            const Expanded(child: SizedBox()),
            Text('Base Stat: ${pokemon.stats.first.baseStat}')
          ])
        ],
      );
    });
  }
}
