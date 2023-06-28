part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {

}


class CartInitial extends CartState {}

class CardSuccessState extends CartState{

  final List<ProductDataModel>cartItems;

  CardSuccessState({required this.cartItems});


}