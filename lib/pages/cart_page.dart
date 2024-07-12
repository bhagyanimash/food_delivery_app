import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_cart_tile.dart';
import 'package:food_delivery_app/models/resturent.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Resturent>(builder: (context, resturent, child) {
      //cart
      final userCart = resturent.cart;

      //scafold UI
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Cart"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Are you sure want to clear the cart?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancle"),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              resturent.clearCart();
                            },
                            child: const Text("Yes"))
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: Column(
          // list of cart
          children: [
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? const Expanded(
                          child: Center(
                          child: Text("Cart is empty..."),
                        ))
                      : Expanded(
                          child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                // get individual cart item
                                final cartItem = userCart[index];

                                //return cart tile UI
                                return MyCartTile(cartItem: cartItem);
                              }),
                        ),
                ],
              ),
            ),
            MyButton(
              onTAp: () {},
              text: "Go to chechout",
            ),
            const SizedBox(height: 25)
          ],
        ),
      );
    });
  }
}
