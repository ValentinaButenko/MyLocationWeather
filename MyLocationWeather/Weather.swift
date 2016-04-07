//
//  Weather.swift
//  MyLocationWeather
//
//  Created by Valentina Butenko on 4/7/16.
//  Copyright © 2016 Valentina Butenko. All rights reserved.
//

import Foundation
import Alamofire

class Weather{

    private var _city: String!
    private var _temperature: String!
    private var _pressure: String!
    private var _humidity: String!
    private var _clouds: String!
    private var _rain: String!
    private var _sunrise: String!
    private var _sunset: String!
    
    var URL = "http://api.openweathermap.org/data/2.5/forecast/weather?q=Kharkiv&APPID=4b7bf11d2f530156f4032f7c3bdbdadc"
   
    
    var city: String{
        get{
            if _city == nil{
               _city = ""
            }
            return _city
        }
    }
    
    
    var temperature: String{
        get{
            if _temperature == nil{
                _temperature = ""
            }
            return _city
        }
    }
    
    var pressure: String{
        get{
            if _pressure == nil{
                _pressure = ""
            }
            return _pressure
        }
    }
    
    var humidity: String{
        get{
            if _humidity == nil{
                _humidity = ""
            }
            return _humidity
        }
    }
    
    var clouds: String{
        get{
            if _clouds == nil {
                _clouds = ""
            }
            return _clouds
        }
    }
    
    var rain: String{
        get{
            if _rain == nil{
                _rain = ""
            }
            return _rain
        }
    }
    
    var sunrise: String{
        get{
            if _sunrise == nil{
                _sunrise = ""
            }
            return _sunrise
        }
    }
    
    var sunset: String{
        get{
            if _sunset == nil{
                _sunset = ""
            }
            return _sunset
        }
    }
    
    
    init(city: String){
        self._city = city
    }
    
    
    func GetWeatherData(){
        
    }
    
    
}











