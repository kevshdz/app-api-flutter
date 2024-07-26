// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
    List<Datum> data;
    String message;
    bool success;

    Products({
        required this.data,
        required this.message,
        required this.success,
    });

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "success": success,
    };
}

class Datum {
    int cantidadEnInventario;
    int categoriaId;
    String descripcion;
    String nombre;
    String precio;
    int productoId;
    int proveedorId;

    Datum({
        required this.cantidadEnInventario,
        required this.categoriaId,
        required this.descripcion,
        required this.nombre,
        required this.precio,
        required this.productoId,
        required this.proveedorId,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        cantidadEnInventario: json["CantidadEnInventario"],
        categoriaId: json["CategoriaID"],
        descripcion: json["Descripcion"],
        nombre: json["Nombre"],
        precio: json["Precio"],
        productoId: json["ProductoID"],
        proveedorId: json["ProveedorID"],
    );

    Map<String, dynamic> toJson() => {
        "CantidadEnInventario": cantidadEnInventario,
        "CategoriaID": categoriaId,
        "Descripcion": descripcion,
        "Nombre": nombre,
        "Precio": precio,
        "ProductoID": productoId,
        "ProveedorID": proveedorId,
    };
}
