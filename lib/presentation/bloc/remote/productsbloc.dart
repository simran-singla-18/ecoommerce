import 'dart:async';

import 'package:ecoommerce/core/network/dataset.dart';
import 'package:ecoommerce/domain/model/products.dart';
import 'package:ecoommerce/presentation/bloc/remote/productsevent.dart';
import 'package:ecoommerce/presentation/bloc/remote/productsstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecase/productusecase.dart';

class ProductsBloc extends Bloc<ProductsEvents,ProductsState>{
  final ProductUseCase productUseCase;
  ProductsBloc(this.productUseCase): super(GetProductsStateLoading()){

    on<GetProductEvent>(fetch);
    on<CartProductEvent>(cartProduct);
  }

  FutureOr<void> fetch(GetProductEvent events,Emitter<ProductsState> emit)async{
   final state = await productUseCase.call("");
   if(state is DataSuccess && state.data!.isNotEmpty) {
      emit(GetProductsStateDone(state.data!));
    }

    if(state is DataFailed)
     emit(GetProductsStateFailed(state.exception!));
  }

  FutureOr<void> cartProduct(CartProductEvent event, Emitter<ProductsState> emit) {
    final state= event.products;
    List<Products>? products=[state!];
    //products= List.from(state);
   // print(products.length);
    emit(CartProductsState(products));
  }
}