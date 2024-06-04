package com.example.lab8.ui

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.Button
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.navigation.NavController
import com.example.lab8.CartItem
import com.example.lab8.Category
import com.example.lab8.Product
import com.example.lab8.addToCart
import com.example.lab8.purchase
import com.example.lab8.removeFromCart
import com.example.lab8.total
import java.util.Locale

@Composable
fun CategoryListScreen(navController: NavController, categories: List<Category>) {
    Column(modifier = Modifier.fillMaxSize()) {
        Text(
            text = "Categories",
            style = TextStyle(fontSize = 24.sp, fontWeight = FontWeight.Bold),
            modifier = Modifier.padding(16.dp)
        )
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Text(text = "Name", modifier = Modifier.weight(1f), style = TextStyle(fontWeight = FontWeight.Bold))
        }
        LazyColumn(modifier = Modifier.weight(1f)) {
            items(categories) { category ->
                Text(
                    text = category.name,
                    modifier = Modifier
                        .padding(16.dp)
                )
            }
        }
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.End
        ) {
            Button(
                onClick = {
                    navController.navigate("products")
                }
            ) {
                Text("Back to products")
            }
        }
    }
}

@Composable
fun ProductListScreen(
    navController: NavController,
    products: List<Product>,
    categories: List<Category>
) {
    Column(modifier = Modifier.fillMaxSize()) {
        Text(
            text = "Products",
            style = TextStyle(fontSize = 24.sp, fontWeight = FontWeight.Bold),
            modifier = Modifier.padding(16.dp)
        )
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Text(text = "Name", modifier = Modifier.weight(1f), style = TextStyle(fontWeight = FontWeight.Bold))
            Text(text = "Price", modifier = Modifier.weight(1f), style = TextStyle(fontWeight = FontWeight.Bold))
            Text(text = "Category", modifier = Modifier.weight(1f), style = TextStyle(fontWeight = FontWeight.Bold))
            Text(text = " ", modifier = Modifier.weight(1f))
        }
        LazyColumn(modifier = Modifier.weight(1f)) {
            items(products) { product ->
                val category = categories.find { c -> c.id == product.categoryId }
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp)
                ) {
                    Text(text = product.name, modifier = Modifier.weight(1f))
                    Text(text = "${product.price} PLN", modifier = Modifier.weight(1f))
                    if (category != null) {
                        Text(text = category.name, modifier = Modifier.weight(1f))
                    } else {
                        Text(text = "-", modifier = Modifier.weight(1f))
                    }
                    Button(onClick = {
                        addToCart(product)
                        navController.navigate("cart")
                    }) {
                        Text("Add to cart")
                    }
                }
            }
        }
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Button(
                onClick = {
                    navController.navigate("categories")
                }
            ) {
                Text("Categories")
            }
            Button(
                onClick = {
                    navController.navigate("cart")
                }
            ) {
                Text("Cart")
            }
        }
    }
}

@Composable
fun CartScreen(navController: NavController, cartItems: List<CartItem>, products: List<Product>) {
    Column(modifier = Modifier.fillMaxSize()) {
        Text(
            text = "Cart",
            style = TextStyle(fontSize = 24.sp, fontWeight = FontWeight.Bold),
            modifier = Modifier.padding(16.dp)
        )
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Text(text = "Name", modifier = Modifier.weight(1f), style = TextStyle(fontWeight = FontWeight.Bold))
            Text(text = "Quantity", modifier = Modifier.weight(1f), style = TextStyle(fontWeight = FontWeight.Bold))
            Text(text = "Price", modifier = Modifier.weight(1f), style = TextStyle(fontWeight = FontWeight.Bold))
            Text(text = " ", modifier = Modifier.weight(1f), style = TextStyle(fontWeight = FontWeight.Bold))
            Text(text = " ", modifier = Modifier.weight(1f), style = TextStyle(fontWeight = FontWeight.Bold))
        }
        LazyColumn(modifier = Modifier.weight(1f)) {
            items(cartItems) { cartItem ->
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp)
                ) {
                    val product = products.find { p -> p.id == cartItem.productId }
                    if(product != null) {
                        Text(text = "${product.name}.", modifier = Modifier.weight(1f))
                        Text(text = "${cartItem.quantity}", modifier = Modifier.weight(1f))
                        Text(text = "${String.format(Locale.UK, "%.2f", cartItem.quantity * product.price).toDouble()} PLN", modifier = Modifier.weight(1f))
                        Button(
                            onClick = {
                                addToCart(product)
                                navController.navigate("cart")
                            }
                        ) {
                            Text(text = "+")
                        }
                        Button(
                            onClick = {
                                removeFromCart(product)
                                navController.navigate("cart")
                            }
                        ) {
                            Text(text = "-")
                        }
                    }
                }
            }
        }
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text("Total: ${String.format(Locale.UK, "%.2f", total).toDouble()} PLN", style = TextStyle(fontSize = 22.sp, fontWeight = FontWeight.Bold))
        }
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Button(
                onClick = {
                    navController.navigate("products")
                }
            ) {
                Text("Back to products")
            }
            Button(
                onClick = {
                    purchase()
                    navController.navigate("products")
                }
            ) {
                Text("Buy")
            }
        }
    }
}
