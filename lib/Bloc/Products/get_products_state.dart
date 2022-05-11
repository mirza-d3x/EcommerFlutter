part of 'get_products_bloc.dart';

abstract class GetProductsState {}

class GetProductsInitial extends GetProductsState {}

class ProductsLoading extends GetProductsState {}

class ProductsLoaded extends GetProductsState {}

class ProductsError extends GetProductsState {}
