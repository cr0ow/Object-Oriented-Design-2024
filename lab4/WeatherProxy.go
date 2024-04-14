package main

import (
	"encoding/json"
	"fmt"
	"io"
	"io/ioutil"
	"net/http"
)

type WeatherProxy struct {
	Client *http.Client
}

func (proxy *WeatherProxy) fetchWeatherData(city string) (Weather, error) {
	url := fmt.Sprintf("http://api.weatherapi.com/v1/current.json?key=aa19f5d0989d45f99bc130144241404&q=%s&aqi=no", city)
	response, err := proxy.Client.Get(url)
	if err != nil {
		print(err)
		return Weather{}, err
	}
	defer func(Body io.ReadCloser) {
		err := Body.Close()
		if err != nil {
		}
	}(response.Body)

	body, err := ioutil.ReadAll(response.Body)
	if err != nil {
		return Weather{}, err
	}

	var weather struct {
		Current struct {
			Condition struct {
				Description string `json:"text"`
			}
			Temperature float64 `json:"temp_c"`
		} `json:"current"`
	}

	err = json.Unmarshal(body, &weather)
	if err != nil {
		return Weather{}, err
	}

	result := Weather{
		City:        city,
		Temperature: weather.Current.Temperature,
		Description: weather.Current.Condition.Description,
	}
	return result, nil
}
