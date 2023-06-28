part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishListInitialEvent extends WishlistEvent{

}
class WishListRemoveDataFromListEvent extends WishlistEvent{
  final ProductDataModel productDataModel ;

  WishListRemoveDataFromListEvent(this.productDataModel);

}
