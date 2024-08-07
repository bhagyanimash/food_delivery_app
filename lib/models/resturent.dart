import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:intl/intl.dart';

class Resturent extends ChangeNotifier {
  final List<Food> _menu = [
    //burgers
    Food(
      name: "Cheeseburger",
      description:
          "Cranberry sauce makes for a gorgeous salad dressing, tart and tangy to contrast with the bitterness of chicory.",
      imagePath: "lib/images/burgers/burger2.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),
    Food(
      name: "Romantic Cheeseburger",
      description:
          "Cranberry sauce makes for a gorgeous salad dressing, tart and tangy to contrast with the bitterness of chicory.",
      imagePath: "lib/images/burgers/burger1.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    //desserts
    Food(
      name: "Classic Dessert",
      description:
          "Cranberry sauce makes for a gorgeous salad dressing, tart and tangy to contrast with the bitterness of chicory. You can also use endives, frisee, or any other bitter greens that you like.",
      imagePath: "lib/images/desserts/dessert1.jpg",
      price: 0.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),
    Food(
      name: "Russian Dessert",
      description:
          "Cranberry sauce makes for a gorgeous salad dressing, tart and tangy to contrast with the bitterness of chicory. You can also use endives, frisee, or any other bitter greens that you like.",
      imagePath: "lib/images/desserts/dessert2.jpg",
      price: 0.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    //drinks
    Food(
      name: "Classic Drink",
      description:
          "Cranberry sauce makes for a gorgeous salad dressing, tart and tangy to contrast with the bitterness of chicory. You can also use endives, frisee, or any other bitter greens that you like.",
      imagePath: "lib/images/drinks/drink1.jpg",
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),
    Food(
      name: "Italy Drink",
      description:
          "Cranberry sauce makes for a gorgeous salad dressing, tart and tangy to contrast with the bitterness of chicory. You can also use endives, frisee, or any other bitter greens that you like.",
      imagePath: "lib/images/drinks/drink2.jpg",
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    //salads
    Food(
      name: "Vegetable Salad",
      description:
          "Cranberry sauce makes for a gorgeous salad dressing, tart and tangy to contrast with the bitterness of chicory. You can also use endives, frisee, or any other bitter greens that you like.",
      imagePath: "lib/images/salads/salad1.jpg",
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),
    Food(
      name: "Mongolian Salad",
      description:
          "Cranberry sauce makes for a gorgeous salad dressing, tart and tangy to contrast with the bitterness of chicory. You can also use endives, frisee, or any other bitter greens that you like.",
      imagePath: "lib/images/salads/salad2.jpg",
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    //sides
    Food(
      name: "Chicken Side",
      description:
          "Cranberry sauce makes for a gorgeous salad dressing, tart and tangy to contrast with the bitterness of chicory. You can also use endives, frisee, or any other bitter greens that you like.",
      imagePath: "lib/images/sides/side1.jpg",
      price: 0.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),
    Food(
      name: "Sausages Side",
      description:
          "Cranberry sauce makes for a gorgeous salad dressing, tart and tangy to contrast with the bitterness of chicory. You can also use endives, frisee, or any other bitter greens that you like.",
      imagePath: "lib/images/sides/side2.jpg",
      price: 0.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    )
  ];

  //user cart
  final List<CartItem> _cart = [];

  String _deliveryAddress = 'Batagalla, Sri Lanka';
  /*
  GETTERS
  */

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  /*
  OPERATIONS
  */

  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    // if item is already excists, increase its quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // otherwise, add new cart item
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //get total number of items in the cart
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }
  /*
  HELPERS
  */

  //generate a receipt
  String displayCardReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here is your receipt.");
    receipt.writeln();

    String formattedDate =
        DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("------------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt
            .writeln("   Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln('Delivering to: $deliveryAddress');

    return receipt.toString();
  }

  //format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  //format list of addons into a string summery

  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name}(${_formatPrice(addon.price)})")
        .join(", ");
  }
}
