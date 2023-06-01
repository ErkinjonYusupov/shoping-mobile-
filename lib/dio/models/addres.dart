class Address{
  String street;
  String suite;
  String city;
  String zipcode;
  dynamic geo;
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });
  factory Address.fromJson(Map<String, dynamic>json)=>Address(
    street:json['street']??'error',
    suite:json['suite']??'error',
    city:json['city']??'error',
    zipcode:json['zipcode']??'error',
    geo: json['geo']??'error',
  );
}