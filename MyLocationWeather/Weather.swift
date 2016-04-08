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
    private var _country: String!
    private var _temperature: String!
    private var _pressure: String!
    private var _humidity: String!
    private var _clouds: String!
    private var _rain: String!
    private var _sunrise: String!
    private var _sunset: String!
    private var _url: String!
    private var _wind: String!
    
    
    var city: String{
        get{
            if _city == nil{
               _city = ""
            }
            return _city
        }
    }
    
    var country:String{
        get {
            if _country == nil{
                _country = ""
            }
            return _country
        }
    }
    
    var temperature: String{
        get{
            if _temperature == nil{
                _temperature = ""
            }
            return _temperature
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
                _rain = "0"
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
    
    var wind: String{
        get{
            if _wind == nil{
                _wind = ""
            }
            return _wind
        }
    }
    
    
    init(city: String){
        self._city = city
        _url = "\(BASE_URL)\(self._city)\(API_KEY)"
        
    }
    
        
    
    func GetWeatherData(completed: DownloadCompleted){
        
        if let urlSunset = NSURL(string: BASE_SUNTIME_URL){
            Alamofire.request(.GET, urlSunset).responseJSON(completionHandler: { response in
                let result = response.result
                
                if let dict = result.value as? Dictionary<String, AnyObject>{
                    if let resultDict = dict["results"] as? Dictionary<String,String>{
                        
                        if let astroSunrise = resultDict["sunrise"]{
                            self._sunrise = astroSunrise
                        }
                        
                        if let astroSunset = resultDict["sunset"]{
                            self._sunset = astroSunset
                        }
                        
                    }
                }
                completed()
            })
        }
        
        if let url = NSURL(string: _url){
            Alamofire.request(.GET, url).responseJSON(completionHandler: { response in
                let result = response.result
                
                if let dict = result.value as? Dictionary<String,AnyObject>{
                    
                    // country  ------------------------------
                    if let cityDict = dict["city"] as? Dictionary<String, AnyObject>{
                        if let countryName = cityDict["country"] as? String{
                            self._country = countryName
                            print(self._country)
                        }
                    }
                    
                    if let listDict = dict["list"] as? [Dictionary<String, AnyObject>]{
                        if let mainDict = listDict[0]["main"] as? Dictionary<String, AnyObject>{
                            
                            // temperature  ------------------------------
                            if let tempKelvin = mainDict["temp"] as? Double{
                                let temp = Int(tempKelvin - 273.15)
                                self._temperature = "\(temp)"
                            }
                            // pressure ----------------------------------
                            if let press = mainDict["pressure"] as? Double{
                                self._pressure = "\(press)"
                            }
                            // humidity ----------------------------------
                            if let humid = mainDict["humidity"] as? Double{
                                self._humidity = "\(humid)"
                            }
                        }
                        
                        if let weatherDict = listDict[0]["weather"] as? [Dictionary<String, AnyObject>]{
                            // clouds ------------------------------------
                            if let cloud = weatherDict[0]["description"] as? String{
                                self._clouds = cloud.capitalizedString
                            }
                        }
                        // wind -----------------------------------------
                        if let windDict = listDict[0]["wind"] as? Dictionary<String, AnyObject>{
                            if let speed = windDict["speed"] as? Double{
                                self._wind = "\(speed)"
                            }
                        }
                        //rain ------------------------------------------
                        if let rainDict = listDict[1]["rain"] as? Dictionary<String, AnyObject>{
                            if let rainValue = rainDict["3h"] as? Double{
                                self._rain = "\(rainValue)"
                            }
                        }
                        
                    }
                }
                completed()
            })
            
        }
        
    }
        
}
    












