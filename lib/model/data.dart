class Data {
  Data({
    required this.restaurants,
    required this.dishes,
  });
  late final List<Restaurants> restaurants;
  late final List<Dishes> dishes;

  Data.fromJson(Map<String, dynamic> json) {
    restaurants = List.from(json['restaurants'])
        .map((e) => Restaurants.fromJson(e))
        .toList();
    dishes = List.from(json['dishes']).map((e) => Dishes.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['restaurants'] = restaurants.map((e) => e.toJson()).toList();
    data['dishes'] = dishes.map((e) => e.toJson()).toList();
    return data;
  }
}

class Restaurants {
  Restaurants({
    required this.name,
    required this.cuisine,
    required this.price,
    required this.rating,
    required this.location,
    required this.hours,
    required this.website,
    required this.phonenumber,
  });
  late final String name;
  late final String cuisine;
  late final String price;
  late final double rating;
  late final Location location;
  late final Hours hours;
  late final String website;
  late final String phonenumber;

  Restaurants.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cuisine = json['cuisine'];
    price = json['price'];
    rating = json['rating'];
    location = Location.fromJson(json['location']);
    hours = Hours.fromJson(json['hours']);
    website = json['website'];
    phonenumber = json['phone number'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['cuisine'] = cuisine;
    data['price'] = price;
    data['rating'] = rating;
    data['location'] = location.toJson();
    data['hours'] = hours.toJson();
    data['website'] = website;
    data['phone number'] = phonenumber;
    return data;
  }
}

class Location {
  Location({
    required this.address,
    required this.city,
    required this.state,
    required this.zipcode,
  });
  late final String address;
  late final String city;
  late final String state;
  late final String zipcode;

  Location.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    state = json['state'];
    zipcode = json['zip code'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['zip code'] = zipcode;
    return data;
  }
}

class Hours {
  Hours({
    required this.open,
    required this.close,
  });
  late final String open;
  late final String close;

  Hours.fromJson(Map<String, dynamic> json) {
    open = json['open'];
    close = json['close'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['open'] = open;
    data['close'] = close;
    return data;
  }
}

class Dishes {
  Dishes({
    required this.name,
    required this.cuisine,
    required this.price,
    required this.description,
  });
  late final String name;
  late final String cuisine;
  late final String price;
  late final String description;

  Dishes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cuisine = json['cuisine'];
    price = json['price'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['cuisine'] = cuisine;
    data['price'] = price;
    data['description'] = description;
    return data;
  }
}
