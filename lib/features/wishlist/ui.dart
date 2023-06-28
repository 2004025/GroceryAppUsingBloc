import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:statemanage/features/cart/Cart_tile_widget.dart';
import 'package:statemanage/features/cart/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanage/features/wishlist/Wishlist_tile_widget.dart';
import 'package:statemanage/features/wishlist/wishlist_bloc.dart';

import '../home/Product_tile_widget.dart';

class WishLIst extends StatefulWidget {
  const WishLIst({Key? key}) : super(key: key);

  @override
  State<WishLIst> createState() => _WishLIstState();
}

class _WishLIstState extends State<WishLIst> {
  final WishlistBloc wishListBloc = WishlistBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wishListBloc.add(WishListInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WishList Items"),

      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishListBloc,

        listenWhen: (previous,current) => current is WishlistActionState,
        buildWhen: (previous,current) => current is !WishlistActionState,

        listener: (context, state) {

        },
        builder: (context, state) {
          switch (state.runtimeType){
            case WishListSuccessState:
              final successState = state as WishListSuccessState;
              return  ListView.builder(
                  itemCount: successState.wishListItems.length,
                  itemBuilder: (context,index){

                    return WishListTileWidget(productDataModel: successState.wishListItems[index], wishlistBloc: wishListBloc);

                    // return Text('rakib');


                  });


          }

          return Container();
        },
      ),



    );
  }
}

