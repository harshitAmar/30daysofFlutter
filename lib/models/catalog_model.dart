class Item {
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
  factory Item.fromMap(Map<dynamic, dynamic> map) {
    return Item(
        id: map['id'],
        name: map['name'],
        desc: map['desc'],
        price: map['price'],
        color: map['color'],
        image: map["image"]);
  }
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}

class CatalogModel {
  static List<Item> items = [
    Item(
      id: 001,
      name: "Oppo A5s",
      desc: "Best quality product by oppo",
      price: 15000,
      color: "#33505a",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc",
    ),
  ];
}

final products = [
  Item(
    id: 001,
    name: "Oppo A5s",
    desc: "Best quality product by oppo",
    price: 15000,
    color: "#33505a",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc",
  ),
];
