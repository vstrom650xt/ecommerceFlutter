class Product {
  String id;
  String nombre;
  String url;
  double precio;
  String descripcion;
  bool masVendido;
  String marca;

  Product({
    required this.id,
    required this.nombre,
    required this.url,
    required this.precio,
    required this.descripcion,
    required this.masVendido,
    required this.marca,
  });

  Product.withMarca({
    required this.marca,
  })   : id = '',
        nombre = '',
        url = '',
        precio = 0.0,
        descripcion = '',
        masVendido = false;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      nombre: json['nombre'],
      url: json['imageUrl'],
      precio: json['precio'],
      descripcion: json['descripcion'],
      masVendido: json['masVendido'],
      marca: json['marca'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'imageUrl': url,
      'precio': precio,
      'descripcion': descripcion,
      'esMasVendido': masVendido,
      'marca': marca,
    };
  }
}
