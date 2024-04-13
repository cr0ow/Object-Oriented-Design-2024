package com.example.demo

data class Credentials(val username: String, val password: String)

const val validUsername = "test"
const val validPassword = "test1"

class AuthorizationService {

    fun authorize(credentials: Credentials): Boolean {
        return credentials.username == validUsername && credentials.password == validPassword
    }

}