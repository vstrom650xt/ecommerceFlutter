class Product {
  String nombre;
  String url;
  double precio;
  String descripcion;
  bool masVendido;
  String marca;

  Product({
    required this.nombre,
    required this.url,
    required this.precio,
    required this.descripcion,
    required this.masVendido,
    required this.marca,
  });

  Product.withMarca({
    required this.marca,
  })   :
        nombre = '',
        url = '',
        precio = 0.0,
        descripcion = '',
        masVendido = false;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      nombre: json['nombre'],
      url: json['url'],
      precio: json['precio'],
      descripcion: json['descripcion'],
      masVendido: json['masVendido'],
      marca: json['marca'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'imageUrl': url,
      'precio': precio,
      'descripcion': descripcion,
      'esMasVendido': masVendido,
      'marca': marca,
    };
  }

  @override
  String toString() {
    return 'Product(nombre: $nombre, precio: $precio)';
  }


}
