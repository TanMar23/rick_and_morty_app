mixin RickAndMortyApi {
  String get baseUrl => 'https://rickandmortyapi.com/api/';
  String endpointParse(String endpoint) =>
      Uri.parse('$baseUrl$endpoint').toString();
}
