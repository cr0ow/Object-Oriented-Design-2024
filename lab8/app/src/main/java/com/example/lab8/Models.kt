package com.example.lab8

data class Category(val id: Int, var name: String)
data class Product(val id: Int, var name: String, var price: Double, var categoryId: Int)
data class CartItem(val id: Int, val productId: Int, var quantity: Int)