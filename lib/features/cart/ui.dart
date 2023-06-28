import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:statemanage/features/cart/Cart_tile_widget.dart';
import 'package:statemanage/features/cart/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/Product_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartBloc.add(CartInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart Items"),

      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,

        listenWhen: (previous,current) => current is CartActionState,
        buildWhen: (previous,current) => current is !CartActionState,

        listener: (context, state) {

        },
        builder: (context, state) {
          switch (state.runtimeType){
            case CardSuccessState:
              final successState = state as CardSuccessState;
              return  ListView.builder(
                  itemCount: successState.cartItems.length,
                  itemBuilder: (context,index){

                    return CartTileWidget(productDataModel:successState.cartItems[index], cartBloc: cartBloc);

                    // return Text('rakib');


                  });


          }

          return Container();
        },
      ),



    );
  }
}
