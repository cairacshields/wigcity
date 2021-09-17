


class WigCityUser {
  final String id;
  final String? name;
  final String email;
  final dynamic purchases;
  final String? streetAddress;
  final String? city;
  final String? zipcode;
  final String? state;
  final dynamic favorites;

  WigCityUser(this.id, this.email, {this.name, this.city, this.state, this.zipcode, this.favorites, this.streetAddress, this.purchases});

  WigCityUser.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'] as String,
        email = json['email'] as String,
        name = json['name'] as String,
        purchases = json['purchases'] as dynamic,
        streetAddress = json['streetAddress'] as String,
        city = json['city'] as String,
        zipcode = json['zipcode'] as String,
        state = json['state'] as String,
        favorites = json['favorites'] as dynamic;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'id': id,
    'email': email,
    'name': name,
    'purchases': purchases,
    'streetAddress': streetAddress,
    'city': city,
    'zipcode': zipcode,
    'state': state,
    'favorites': favorites,
  };
}