import 'package:bloc/bloc.dart';
import 'package:ecommerceapi/Api/Product/ProductIDModel.dart';
import 'package:meta/meta.dart';

import '../../../Api/Product/productApi.dart';

part 'get_id_product_event.dart';

part 'get_id_product_state.dart';

class GetIdProductBloc extends Bloc<GetIdProductEvent, GetIdProductState> {
  late List<ProductIdModel> productIdModel;
  ProductApi productApi;

  GetIdProductBloc(this.productApi) : super(GetIdProductInitial()) {
    on<GetIdProductNew>((event, emit) async {
      emit(GetIdProductLoading());

      try {
        productIdModel = await productApi.getProductID(event.id);
        emit(GetIdProductLoaded());
      } catch (e) {
        print(e);
        emit(GetIdProductError());
      }
      // TODO: implement event handler
    });
  }
}
