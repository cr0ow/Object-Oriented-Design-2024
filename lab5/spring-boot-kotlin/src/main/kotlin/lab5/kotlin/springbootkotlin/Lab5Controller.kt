package lab5.kotlin.springbootkotlin;

import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RestController;

data class Service(val id: Int, val name: String, val price: Float)
data class Payment(var id: Int, val amount: Float, val services: List<Service>)

private val services = listOf(
    Service(1, "English classes", 70f),
    Service(2, "Deutsh classes", 100f),
    Service(3, "French classes", 100f),
    Service(4, "Japanese classes", 120f)
)

private var nextPaymentId = 1;
private val payments = mutableListOf<Payment>()

@CrossOrigin
@RestController
class Lab5Controller {

    @GetMapping("/services")
    fun getServices(): List<Service> {
        return services;
    }

    @PostMapping("payments")
    fun newPayment(@RequestBody payment: Payment): Payment {
        payment.id = nextPaymentId++
        payments.add(payment)
        return payment
    }

}

