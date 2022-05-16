part of 'get_id_product_bloc.dart';

abstract class GetIdProductEvent {}

class GetIdProductNew extends GetIdProductEvent{

 String id;
  GetIdProductNew(this.id);
}


