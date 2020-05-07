import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()

class ProductModel{

  List data;

  ProductModel({this.data});

  factory ProductModel.fromJson(Map<String,dynamic> json) => _$ProductModelFromJson(json);

  Map<String,dynamic> toJson() => _$ProductModelToJson(this);


}

