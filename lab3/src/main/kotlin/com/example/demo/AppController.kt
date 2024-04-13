package com.example.demo

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RestController

data class Product(val id: Int, val name: String)

var data: List<Product> = mutableListOf(
    Product(1, "jeden"),
    Product(2, "dwa"),
    Product(3, "trzy")
)

@RestController
class AppController(
    @Autowired
    private val authorizationService: AuthorizationService
) {

    @PostMapping("/auth")
    fun authorize(@RequestBody credentials: Credentials): Boolean {
        return authorizationService.authorize(credentials)
    }

    @GetMapping("/")
    fun getAll(): List<Product> {
        return data
    }

}
