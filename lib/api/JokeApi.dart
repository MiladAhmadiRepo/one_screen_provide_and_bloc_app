import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:one_screen_bloc_app/Constants/base_constants.dart';
import 'package:one_screen_bloc_app/model/joke_model.dart';

class JokeApi{
  Map<String, String> get headers => {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "x-api-key": BaseConstants.apiKey ,
  };

  Future<joke_model> fetchJoke() async {
    final response = await http.get(Uri.parse(BaseConstants.baseUrl),headers: headers);

    if (response.statusCode == 200) {
      return joke_model.fromJson(jsonDecode(response.body));
    } else {
      return joke_model(id: -1,punchline: "",setup: "",type: "");
    }
  }
}
