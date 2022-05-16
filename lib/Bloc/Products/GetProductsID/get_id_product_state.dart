part of 'get_id_product_bloc.dart';

@immutable
abstract class GetIdProductState {}

class GetIdProductInitial extends GetIdProductState {}

class GetIdProductLoading extends GetIdProductState {}

class GetIdProductLoaded extends GetIdProductState {}

class GetIdProductError extends GetIdProductState {}
