import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Pizza extends Equatable {
  final String id;
  final String name;
  final Image image;

   Pizza({
    required this.name,
    required this.id,
    required this.image,
  });

  @override
  // TODO: implement props
  List<Object?> get props {
    return [id, name, image];
  }


  static List<Pizza> pizzas = [
    Pizza(name: "pizza", id: "0", image: Image.asset('asset/images/1.png')),
    Pizza(name: "pizza", id: "1", image: Image.asset('asset/images/2.png')),
  ];


}