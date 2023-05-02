import 'dart:convert';
import 'dart:io';

import '../entity/pokemon.dart';

class ApiClient {
  static const _host = 'https://pokeapi.co/api/v2';
  final _client = HttpClient();

  Future<Pokemon> getPokemon(String pokemonName) async {
    const endpoint = 'pokemon';
    final json =
        await _getResponseToJson(uri: '$_host/$endpoint/$pokemonName/');
    final pokemonResponse = Pokemon.fromJson(json);
    return pokemonResponse;
  }

  Future<Map<String, dynamic>> _getResponseToJson({required String uri}) async {
    final url = Uri.parse(uri);
    final request = await _client.getUrl(url);
    final response = await request.close();
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v) as Map<String, dynamic>);

    return json;
  }
}
