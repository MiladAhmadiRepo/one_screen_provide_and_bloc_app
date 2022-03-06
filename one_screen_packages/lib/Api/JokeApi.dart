import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Constants/BaseConstants.dart';
import '../Model/JokeModel.dart';


class JokeApi{
  Map<String, String> get headers => {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "x-Api-key": BaseConstants.apiKey ,
  };

  Future<JokeModel> fetchJoke() async {
    final response = await http.get(Uri.parse(BaseConstants.baseUrl),headers: headers);

    if (response.statusCode == 200) {
      return JokeModel.fromJson(jsonDecode(response.body));
    } else {
      return JokeModel(id: -1,punchline: "",setup: "",type: "");
    }
  }
}
