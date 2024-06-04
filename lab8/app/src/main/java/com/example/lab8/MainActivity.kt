package com.example.lab8

import android.annotation.SuppressLint
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.Scaffold
import androidx.compose.ui.Modifier
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.example.lab8.ui.CartScreen
import com.example.lab8.ui.CategoryListScreen
import com.example.lab8.ui.ProductListScreen
import com.example.lab8.ui.theme.Lab8Theme

class MainActivity : ComponentActivity() {

    @SuppressLint("UnusedMaterial3ScaffoldPaddingParameter")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            Lab8Theme {
                val navController = rememberNavController()
                ProductListScreen(navController, productList, categoryList)
                Scaffold(modifier = Modifier.fillMaxSize()) {
                    NavHost(navController, startDestination = "products") {
                        composable("categories") {
                            CategoryListScreen(navController, categoryList)
                        }
                        composable("products") {
                            ProductListScreen(navController, productList, categoryList)
                        }
                        composable("cart") {
                            CartScreen(navController, cartItemList, productList)
                        }
                    }
                }
            }
        }
    }

}