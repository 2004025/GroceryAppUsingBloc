import 'package:flutter/material.dart';
import 'package:statemanage/Models/home_product_data_model.dart';
import 'package:statemanage/features/home/home_bloc.dart';

import 'cart_bloc.dart';

class CartTileWidget extends StatelessWidget {

  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget({Key? key, required this.productDataModel, required this.cartBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black,),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,width: double.maxFinite,
            decoration:  BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(productDataModel.imageUrl))),
          ),
          const SizedBox(height: 20,),
          Text(productDataModel.name,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Text(productDataModel.description),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$ "+productDataModel.price.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        cartBloc.add(CartRemoveFromCartEvent(productDataModel));

                      },
                      icon: Icon(Icons.shopping_bag)),

                ],
              )

            ],
          ),

        ],
      ),
    );
  }
}
