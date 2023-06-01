class Company{
  String name;
  String catchPhrase;
  String bs;
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });
  factory Company.fromJson(Map<String, dynamic>json)=>
  Company(name: json['name']??"error", catchPhrase: json['catchPhrase']??"error", bs: json['bs']??"error");
}