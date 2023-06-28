import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:statemanage/data/cart_items.dart';

import '../../Models/home_product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void>cartInitialEvent(CartInitialEvent event,Emitter<CartState>emit){
    emit(CardSuccessState(cartItems: cardItems));
  }

  FutureOr<void>cartRemoveFromCartEvent(CartRemoveFromCartEvent event,Emitter<CartState>emit){
    //get the cart items
    //check is your Product model
    //run a function that remove that product
    //emit the state

    cardItems.remove(event.productDataModel);
    emit(CardSuccessState(cartItems: cardItems));
  }


}
