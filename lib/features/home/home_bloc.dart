
import 'dart:async';
// import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:statemanage/data/grocery_data.dart';
import 'package:statemanage/data/wishlist_items.dart';

import '../../Models/home_product_data_model.dart';
import '../../data/cart_items.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCardButtonClickedEvent>(
        homeProductCardButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(
        homeWishlistButtonNavigateEvent);

    on<HomeCartButtonNavigateEvent>(
        homeCartButtonNavigateEvent);
  }
  FutureOr<void>homeInitialEvent(HomeInitialEvent event,Emitter<HomeState>emit)async{
    emit(HomeloadingState());
    await Future.delayed(Duration(seconds: 3));

    List<ProductDataModel>ff=[];
    for(Map<String,dynamic>x in GroceryData.groceryProducts){
      var k=ProductDataModel(id:x['id'],name: x['name'],description: x['description'],price: x['price'],imageUrl: x['imageUrl'] );
      ff.add(k);
    }

    // emit(HomeLoadedSuccessState(products: GroceryData.groceryProducts.map((e) => ProductDataModel(
    //     id: e['id'], name: e['name'], description: e['description'], price: e['price'], imageUrl: e['imageUrl'])).toList()));

    try {
      emit(HomeLoadedSuccessState(products: ff));
    }

    catch(e){
    print("fff");
    }


  }

  FutureOr<void>homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event ,Emitter<HomeState>emit ) {
    print("wish product clicked");
    wishListItems.add(event.clickedProduct);
    emit(HomeProductItemWishListedActionState());

  }

  FutureOr<void>homeProductCardButtonClickedEvent(
      HomeProductCardButtonClickedEvent event ,Emitter<HomeState>emit ) {
    print("Card click ");
   cardItems.add(event.clickedProduct);
   emit(HomeProductItemCardedListedActionState());


  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event ,Emitter<HomeState>emit ) {
    print("card  Navigate clicked");
    emit(HomeNavigateToCartPageActionState());

  }

  FutureOr<void>homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event ,Emitter<HomeState>emit ) {
    print("wish product Navigate");
    emit(HomeNavigateToWishlistPageActionState());
  }



}