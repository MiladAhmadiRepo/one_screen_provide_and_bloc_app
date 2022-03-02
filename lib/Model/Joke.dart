class Joke {
  int? _id;
  String? _type;
  String? _setup;
  String? _punchline;

  int? get id => _id;
  String? get type => _type;
  String? get setup => _setup;
  String? get punchline => _punchline;

  Joke({
      int? id,
      String? type, 
      String? setup, 
      String? punchline,}){
    _id = id;
    _type = type;
    _setup = setup;
    _punchline = punchline;
}

  Joke.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _setup = json['setup'];
    _punchline = json['punchline'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['setup'] = _setup;
    map['punchline'] = _punchline;
    return map;
  }
  @override
  List<Object> get props => [_id??0, _type??"",_setup??"",_punchline??""];
}