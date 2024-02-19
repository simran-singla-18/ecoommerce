import 'dart:async';

import 'package:ecoommerce/core/network/dataset.dart';
import 'package:ecoommerce/domain/model/products.dart';
import 'package:ecoommerce/domain/usecase/localproductusecase.dart';
import 'package:ecoommerce/presentation/bloc/local/localproductevent.dart';
import 'package:ecoommerce/presentation/bloc/local/localproductstate.dart';
import 'package:ecoommerce/presentation/bloc/remote/productsevent.dart';
import 'package:ecoommerce/presentation/bloc/remote/productsstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecase/productusecase.dart';
import '../../../domain/usecase/removeproductusecase.dart';
import '../../../domain/usecase/saveproductusecase.dart';

class LocalProductBloc extends Bloc<LocalProductEvent,LocalProductState>{
  final LocalProductUseCase localProductUseCase;
  final SaveProductUseCase saveProductUseCase;
  final RemoveProductUsecase removeProductUseCase;
  LocalProductBloc(this.localProductUseCase,this.saveProductUseCase,this.removeProductUseCase)
      : super(LocalProductsStateLoading()){

    on<GetAllProductsEvent>(getAllLocalProducts);
    on<SaveProductsEvent>(saveProducts);
    on<RemoveProductsEvent>(removeProducts);
  }

  FutureOr<void> getAllLocalProducts(GetAllProductsEvent events,Emitter<LocalProductState> emit)async{
    final state = await localProductUseCase.call("");
      emit(GetAllLocalProductsStateDone(state));
    }

  FutureOr<void> saveProducts(SaveProductsEvent event, Emitter<LocalProductState> emit) async {
    await saveProductUseCase.call(event.productsEntity!);
    final products = await localProductUseCase("");
    emit(GetAllLocalProductsStateDone(products));
  }

  FutureOr<void> removeProducts(RemoveProductsEvent event, Emitter<LocalProductState> emit) async {
    await removeProductUseCase.call(event.productsEntity!);
    final products = await localProductUseCase("");
    emit(GetAllLocalProductsStateDone(products));
  }
}