//
//  ViewController.swift
//  MyLocationWeather
//
//  Created by Valentina Butenko on 4/6/16.
//  Copyright © 2016 Valentina Butenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var weather: Weather!
    
    @IBOutlet weak var city: UILabel!
    
    @IBOutlet weak var bgImg: DayNightImg!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var sunrise: UILabel!
    @IBOutlet weak var sunset: UILabel!
    @IBOutlet weak var clouds: UILabel!
    @IBOutlet weak var wind: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var rain: UILabel!
    
    let kharkiv = Weather(city: "Kharkiv")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        kharkiv.GetWeatherData{ () -> () in
            // this will be called after Download is done
            print("HEYY")
            
            self.UpdateUI()
            
        }
        
    }
    
    
    func UpdateUI(){
        city.text = kharkiv.city
        country.text = kharkiv.country
        temperature.text = kharkiv.temperature
        sunrise.text = kharkiv.sunrise
        sunset.text = kharkiv.sunset
        clouds.text = kharkiv.clouds
        wind.text = kharkiv.wind
        humidity.text = kharkiv.humidity
        pressure.text = kharkiv.pressure
        rain.text = kharkiv.rain
        
        bgImg.SelectImage(kharkiv)
        
        
    }

    
}

