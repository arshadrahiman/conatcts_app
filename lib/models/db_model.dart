class DbUsers {
  String name;
  String userName;
  String phone;
  String email;
  String website;
  String companyName;
  String companycatchPhrase;
  String companyBs;
  String addressStreet;
  String addressSuit;
  String addressCity;
  String zipcode;
  String latitude;
  String longitude;

  DbUsers(
      {required this.name,
      required this.phone,
      required this.email,
      required this.userName,
      required this.addressCity,
      required this.addressStreet,
      required this.addressSuit,
      required this.companyBs,
      required this.companyName,
      required this.companycatchPhrase,
      required this.latitude,
      required this.longitude,
      required this.website,
      required this.zipcode});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'username': userName,
      'addcity': addressCity,
      'addstreet': addressStreet,
      'addsuit': addressSuit,
      'cmpnybs': companyBs,
      'cmpnyname': companyName,
      'cmpnyphrase': companycatchPhrase,
      'lat': latitude,
      'lng': longitude,
      'website': website,
      'zipcode': zipcode,
    
    };
  }
}
