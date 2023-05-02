import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_test/domain/bloc/pokemon_bloc.dart';

import '../pokemon_card/pokemon_card.dart';

class RandomPokemon extends StatelessWidget {
  const RandomPokemon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Search pokemon')),
        body: const _RandomPokemon());
  }
}

class _RandomPokemon extends StatelessWidget {
  const _RandomPokemon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          ElevatedButton(
              onPressed: () async {
                final int randomInt = Random().nextInt(800);
                await context
                    .read<PokemonCubit>()
                    .searchPokemon(randomInt.toString());
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: const Text('Show Random Pokemon')),
          const SizedBox(
            height: 12,
          ),
          const PokemonCard(),
        ],
      ),
    );
  }
}

// class _SearchForm extends StatefulWidget {
//   const _SearchForm({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<_SearchForm> createState() => _SearchFormState();
// }

// class _SearchFormState extends State<_SearchForm> {
//   final TextEditingController _controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextFormField(
//           controller: _controller,
//           onEditingComplete: () {
//             context.read<PokemonCubit>().searchPokemon(_controller.text);
//             FocusManager.instance.primaryFocus?.unfocus();
//           },
//           decoration: const InputDecoration(hintText: 'Input pokemon name'),
//         ),
//         ElevatedButton(
//             onPressed: () async {
//               await context
//                   .read<PokemonCubit>()
//                   .searchPokemon(_controller.text);
//               FocusManager.instance.primaryFocus?.unfocus();
//             },
//             child: const Text('Search')),
//       ],
//     );
//   }
// }


