import 'package:equatable/equatable.dart';

// class Veggie extends Equatable {
//   String title;

//   @override
//   // TODO: implement props
//   List<Object> get props => [title];

//   Item(this.title);

//   Veggie copyWith({ String name,
//   int quantity,
//   int price,
//   String quantityType,
//   String imageUrl,
//   int veggieId,
//   String category,}) {
//     return Veggie(name ?? this.name, );
//   }
//   // factory Item.toTitle(String title): title = title;
// }

class Veggie extends Equatable {
  final String name;
  final int quantity;
  final int each_price;
  final String quantity_type;
  final String image_url;
  final int veggram_id;
  final String category;

  Veggie({
    this.veggram_id,
    this.name,
    this.quantity,
    this.each_price,
    this.quantity_type,
    this.image_url,
    this.category,
  });

  factory Veggie.fromJson(Map<String, dynamic> json) {
    return Veggie(
      veggram_id: json['veggram_id'],
      name: json['name'],
      quantity: json['quantity'],
      quantity_type: json['quantity_type'],
      each_price: json['each_price'],
      image_url: json['image_url'],
      category: json['category'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'veggram_id': veggram_id,
      'quantity': quantity,
      'quantity_type': quantity_type,
      'each_price': each_price,
      'image_url': image_url,
      'category': category,
    };
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        veggram_id,
        name,
        each_price,
        quantity,
        quantity_type,
        image_url,
        category,
      ];

  Veggie copyWith({
    String name,
    int quantity,
    int each_price,
    String quantity_type,
    String image_url,
    int veggieId,
    String category,
    int priceQuantity,
    int calcPrice,
  }) {
    return Veggie(
      category: this.category,
      name: this.name,
      image_url: this.image_url,
      quantity: this.quantity,
      quantity_type: this.quantity_type,
      each_price: this.each_price,
      veggram_id: this.veggram_id,
    );
  }
}
