import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:menu_egypt/models/cart.dart';
import 'package:menu_egypt/models/cart_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  bool _isLoading = false;
  CartModel _cart;

  CartProvider() {
    initCart();
  }

  bool get isLoading {
    return _isLoading;
  }

  CartModel get cart {
    return _cart;
  }

  initCart() async {
    _isLoading = true;
    notifyListeners();
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final json = preferences.getString('cart') ?? '';
    print(json);
    if (json.isNotEmpty) {
      Map<String, dynamic> map = jsonDecode(json);
      _cart = CartModel.fromJson(map);
      _cart.subTotalPrice = calculateCartSubtotal();
      _cart.totalPrice = calculateCartTotal();
    } else {
      _cart = CartModel(
        cartItems: [],
        resturantId: 0,
        deliveryPrice: 0.0,
        subTotalPrice: 0.0,
        totalPrice: 0.0,
      );
    }
    _isLoading = false;
    notifyListeners();
  }

  double calculateCartSubtotal() {
    double subTotal = 0.0;
    for (CartItemModel cartItem in _cart.cartItems) {
      subTotal += cartItem.quantity * cartItem.price;
    }
    return subTotal;
  }

  double calculateCartTotal() {
    double total = 0.0;
    total = _cart.subTotalPrice + _cart.deliveryPrice;
    return total;
  }

  addItemToCart(CartItemModel cartItem, int resturantId) async {
    bool theSameItemExistsInCart = false;
    //if the same item is found in cart .. update it's quantity
    for (CartItemModel item in _cart.cartItems) {
      if (cartItem.id == item.id &&
          cartItem.weightId == item.weightId &&
          cartItem.firstAddId == item.firstAddId &&
          cartItem.secondAddId == item.secondAddId) {
        item.quantity += cartItem.quantity;
        theSameItemExistsInCart = true;
        break;
      }
    }
    //if first item to add to cart OR the item is new item
    if (_cart.cartItems.isEmpty || !theSameItemExistsInCart) {
      _cart.cartItems.add(cartItem);
    }
    _cart.resturantId = resturantId;
    _cart.deliveryPrice = 10.0;
    _cart.subTotalPrice = calculateCartSubtotal();
    _cart.totalPrice = calculateCartTotal();
    await updateCartToSharedPref();
    notifyListeners();
  }

  removeItemFromCart(int itemIndex) async {
    _cart.cartItems.removeAt(itemIndex);
    _cart.subTotalPrice = calculateCartSubtotal();
    _cart.totalPrice = calculateCartTotal();
    await updateCartToSharedPref();
    notifyListeners();
  }

  clearCart() async {
    _cart.cartItems.clear();
    _cart.deliveryPrice = 0.0;
    _cart.subTotalPrice = 0.0;
    _cart.totalPrice = 0.0;
    await removeCartFromShredPref();
    notifyListeners();
  }

  editCartItem(CartItemModel item, int itemIndex) async {
    _cart.cartItems[itemIndex] = item;
    _cart.subTotalPrice = calculateCartSubtotal();
    _cart.totalPrice = calculateCartTotal();
    await updateCartToSharedPref();
    notifyListeners();
  }

  updateCartToSharedPref() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    Map<String, dynamic> json = _cart.toJson();
    print(json);
    preferences.setString('cart', jsonEncode(json));
  }

  removeCartFromShredPref() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('cart');
  }
}
