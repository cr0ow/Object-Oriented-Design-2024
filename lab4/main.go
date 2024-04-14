package main

import (
	"github.com/labstack/echo/v4"
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
	"log"
	"net/http"
	"time"
)

var db, err = gorm.Open(sqlite.Open("weather.db"), &gorm.Config{})

func main() {

	if err != nil {
		log.Fatalf("Cannot connect to database: %v", err)
	}
	err = db.AutoMigrate(&Weather{})
	if err != nil {
		log.Fatalf("Error during database migration: %v", err)
	}

	echoInstance := echo.New()

	client := &http.Client{
		Timeout: 10 * time.Second,
	}
	weatherProxy := &WeatherProxy{
		Client: client,
	}

	echoInstance.GET("/weather", weatherHandler(weatherProxy))

	err = echoInstance.Start(":8080")
	if err != nil {
		return
	}
}
