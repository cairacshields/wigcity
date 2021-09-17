


class Wig {
  final String id;
  final String name;
  final String description;
  final dynamic colors;
  final dynamic lengths;
  final dynamic styles;
  final dynamic price;
  final int quantityAvailable;
  final dynamic pictures;
  final int totalPurchases;
  final dynamic reviews;


  Wig(
      this.id, this.name, this.description, this.colors,
      this.lengths, this.styles, this.price, this.quantityAvailable, this.pictures, {this.totalPurchases = 0, this.reviews});

  Wig.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        description = json['description'] as String,
        colors = json['colors'] as dynamic,
        lengths = json['lengths'] as dynamic,
        styles = json['styles'] as dynamic,
        price = json['price'] as dynamic,
        quantityAvailable = json['quantityAvailable'] as int,
        pictures = json['pictures'] as dynamic,
        totalPurchases = json['totalPurchases'] as int,
        reviews = json['reviews'] as dynamic;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'id': id,
    'name': name,
    'description': description,
    'colors': colors,
    'lengths': lengths,
    'styles': styles,
    'price': price,
    'quantityAvailable': quantityAvailable,
    'pictures': pictures,
    'totalPurchases': totalPurchases,
    'reviews': reviews,
  };
}