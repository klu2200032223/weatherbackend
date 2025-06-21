package com.example.demo;

import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/api/weather")
public class WeatherController {

    private final String API_KEY = "69c4a64f20818f9de1de18b3e7caf390"; // Replace this

    @GetMapping("/{city}")
    public ResponseEntity<?> getWeather(@PathVariable String city) {
        String url = "https://api.openweathermap.org/data/2.5/weather?q=" + city
                + "&appid=" + API_KEY + "&units=metric";

        try {
            RestTemplate restTemplate = new RestTemplate();
            String response = restTemplate.getForObject(url, String.class);
            return ResponseEntity.ok().body(response);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("City not found or API error.");
        }
    }
}
