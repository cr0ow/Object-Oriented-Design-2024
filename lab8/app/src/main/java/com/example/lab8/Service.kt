package com.example.lab8

var productList: List<Product> = mutableListOf(
    Product(1, "Mleko", 3.5, 1),
    Product(2, "Chleb", 5.33, 1),
    Product(3, "Mydło", 4.0, 2)
)
var categoryList: List<Category> = mutableListOf(
    Category(1, "Jedzenie"),
    Category(2, "Przemysłowe"),
)
var cartItemList: List<CartItem> = mutableListOf()
var total = 0.0

fun addToCart(product: Product) {
    val item = cartItemList.find { it.productId == product.id }
    if(item != null) {
        val idx = cartItemList.indexOf(item)
        cartItemList[idx].quantity += 1
    } else {
        cartItemList += CartItem(cartItemList.size + 1, product.id, 1)
    }
    total += product.price
}

fun removeFromCart(product: Product) {
    val item = cartItemList.find { it.productId == product.id }
    if(item != null) {
        val idx = cartItemList.indexOf(item)
        cartItemList[idx].quantity -= 1
        if(cartItemList[idx].quantity == 0) {
            cartItemList = cartItemList.filter { it.id != item.id }
        }
        total -= product.price
    }
}

fun purchase() {
    cartItemList = mutableListOf()
    total = 0.0
}