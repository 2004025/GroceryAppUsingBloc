import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:statemanage/Models/home_product_data_model.dart';
import 'package:statemanage/data/wishlist_items.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishListInitialEvent>(wishlistInitialEvent);
    on<WishListRemoveDataFromListEvent>(wishListRemoveDataFromListEvent);
  }

  FutureOr<void>wishlistInitialEvent(WishListInitialEvent event,Emitter<WishlistState>emit ){
    emit(WishListSuccessState(wishListItems));
  }

  FutureOr<void>wishListRemoveDataFromListEvent(WishListRemoveDataFromListEvent event,Emitter<WishlistState>emit ){

    wishListItems.remove(event.productDataModel);
    emit(WishListSuccessState(wishListItems));

  }
}
