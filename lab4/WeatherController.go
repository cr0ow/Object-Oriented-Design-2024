package main

import (
	"github.com/labstack/echo/v4"
	"gorm.io/gorm"
	"log"
	"net/http"
)

type Weather struct {
	gorm.Model
	City        string  `gorm:"not null"`
	Temperature float64 `gorm:"not null"`
	Description string  `gorm:"not null"`
}

var initialWeatherData = []Weather{
	{City: "New York", Temperature: 20.0, Description: "Sunny"},
	{City: "London", Temperature: 15.0, Description: "Cloudy"},
}

func weatherHandler(proxy *WeatherProxy) echo.HandlerFunc {
	return func(c echo.Context) error {
		city := c.QueryParam("city")

		weatherData, err := proxy.fetchWeatherData(city)
		if err != nil {
			return c.JSON(http.StatusInternalServerError, map[string]string{"error": "Unable to fetch weather data"})
		}

		result := db.Create(&weatherData)
		if result.Error != nil {
			log.Fatalf("Error while saving data: %v", result.Error)
		}

		return c.JSON(http.StatusOK, weatherData)
	}
}
