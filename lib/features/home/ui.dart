import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:statemanage/features/home/Product_tile_widget.dart';
import 'package:statemanage/features/home/home_bloc.dart';
import 'package:statemanage/features/home/home_bloc.dart';
import 'package:statemanage/features/wishlist/ui.dart';

import '../cart/ui.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  void initState() {
    // TODO: implement initState
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }
  final HomeBloc homeBloc = HomeBloc();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        // TODO: implement listener
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WishLIst()));
        }
        else if(state is HomeProductItemCardedListedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('item Carted')));
        }
        else if(state is HomeProductItemWishListedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('item WishList')));

        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeloadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeLoadedSuccessState:

            //HomeLoadedSuccessState er modde grocery list ase
            // final successState= State as HomeLoadedSuccessState;

          final successState = state as HomeLoadedSuccessState;
          //ei khane "state " hobe,,,,,not "State"
            //HomeLoadedSuccessState er sob kiso ami access korte parbo from  successState
            return Scaffold(
              appBar: AppBar(
                title: Text("Rakib Grocery App"),
                backgroundColor: Colors.teal,
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigateEvent());
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: Icon(Icons.shopping_bag_outlined)),
                ],
              ),

              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context,index){

                      return ProductTileWidget(productDataModel: successState.products[index], homeBloc: homeBloc,);

                    // return Text('rakib');



              }),
            );
          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text("error"),
              ),
            );

          default:
            return Scaffold(
              body: Center(
                child: Text("error"),
              ),
            );
        }
      },
    );
  }
}
