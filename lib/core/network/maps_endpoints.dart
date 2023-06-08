abstract class MapEndPoints {
  String fetchPlacesSuggestionsUrl(String input, String apiKey,
      String sessionToken, String components, String lang);

  String fetchPlaceComponentsUrl(
      String placeId, String apiKey, String sessionToken, String lang);
}

class MapEndPointsImpl extends MapEndPoints {
  @override
  String fetchPlaceComponentsUrl(
      String placeId, String apiKey, String sessionToken, String lang) {
    return 'https://maps.googleapis.com/maps/api/place/details/json?fields=name%2Cgeometry%2Cplace_id&place_id=$placeId&key=$apiKey&sessiontoken=$sessionToken&language=$lang';
  }

  @override
  String fetchPlacesSuggestionsUrl(String input, String apiKey,
      String sessionToken, String components, String lang) {
    return 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$apiKey&sessiontoken=$sessionToken&$components&language=$lang';
  }
}
