import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokemon_test/domain/api_client/api_client.dart';
import 'package:pokemon_test/domain/bloc/pokemon_bloc.dart';
import 'package:pokemon_test/ui/navigation/main_navigation.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Главная')),
      body: const Menu(),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: (() => Navigator.pushNamed(
                context, MainNavigationRouteNames.searchPokemon)),
            child: const Text('Search pokemon')),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () async {
              Navigator.pushNamed(
                  context, MainNavigationRouteNames.randomPokemon);
              // final int randomInt = Random().nextInt(800);
              // await PokemonCubit.searchPokemon(randomInt.toString());
            },
            child: const Text('Show random pokemon')),
      ],
    ));
  }
}
