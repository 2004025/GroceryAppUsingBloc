part of 'home_bloc.dart';

@immutable
//state two types 1.build state 2.actionable state


abstract class HomeState {} //when ever i go in the app my ui should be build this class control it

abstract class HomeActionState extends HomeState{}

class HomeInitial extends HomeState {


}

class HomeloadingState extends HomeState{}

class HomeLoadedSuccessState extends HomeState{
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({required this.products});


}

class HomeErrorState extends HomeState{}

class HomeNavigateToWishlistPageActionState extends HomeActionState{

}

class HomeNavigateToCartPageActionState extends HomeActionState{

}
class HomeProductItemWishListedActionState extends HomeActionState{

}

class HomeProductItemCardedListedActionState extends HomeActionState{

}