part of 'home_bloc.dart';

@immutable


abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{

}

class HomeProductWishlistButtonClickedEvent extends HomeEvent{
         final ProductDataModel clickedProduct;

  HomeProductWishlistButtonClickedEvent(this.clickedProduct);

}

class HomeProductCardButtonClickedEvent extends HomeEvent{
  final ProductDataModel clickedProduct;

  HomeProductCardButtonClickedEvent(this.clickedProduct);


}
class HomeWishlistButtonNavigateEvent extends HomeEvent{

}

class HomeCartButtonNavigateEvent extends HomeEvent{

}
