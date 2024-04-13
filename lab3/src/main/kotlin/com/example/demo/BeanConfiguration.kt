package com.example.demo

import org.springframework.context.annotation.*
import org.springframework.core.type.AnnotatedTypeMetadata
import java.util.logging.Level
import java.util.logging.LogManager
import java.util.logging.Logger

@Configuration
class BeanConfiguration {

    private val logger: Logger = LogManager.getLogManager().getLogger(Logger.GLOBAL_LOGGER_NAME)

    @Bean(name = ["authorizationService"])
    @Conditional(EagerServiceCondition::class)
    fun eagerAuthorizationService(): AuthorizationService {
        logger.log(Level.INFO, "EAGER bean created")
        return AuthorizationService()
    }

    @Bean(name = ["authorizationService"])
    @Lazy(true)
    @Conditional(LazyServiceCondition::class)
    fun lazyAuthorizationService(): AuthorizationService {
        logger.log(Level.INFO, "LAZY bean created")
        return AuthorizationService()
    }

}

class EagerServiceCondition : Condition {
    override fun matches(context: ConditionContext, metadata: AnnotatedTypeMetadata): Boolean {
        val serviceType = context.environment.getProperty("service.type")
        return serviceType == "eager"
    }
}

class LazyServiceCondition : Condition {
    override fun matches(context: ConditionContext, metadata: AnnotatedTypeMetadata): Boolean {
        val serviceType = context.environment.getProperty("service.type")
        return serviceType == "lazy"
    }
}