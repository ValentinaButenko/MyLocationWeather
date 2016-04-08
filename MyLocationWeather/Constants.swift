//
//  Constants.swift
//  MyLocationWeather
//
//  Created by Valentina Butenko on 4/8/16.
//  Copyright © 2016 Valentina Butenko. All rights reserved.
//

import Foundation


    let BASE_URL = "http://api.openweathermap.org/data/2.5/forecast/weather?q="
    let API_KEY = "&APPID=4b7bf11d2f530156f4032f7c3bdbdadc"
    let lng = 36.25
    let lat = 50

    let BASE_SUNTIME_URL = "http://api.sunrise-sunset.org/json?lat=\(lat)&lng=\(lng)&date=today"

    let date = NSDate()
    let calendar = NSCalendar.currentCalendar()
    let components = calendar.components(.Hour, fromDate: date)
    let hour = components.hour

    typealias DownloadCompleted = () -> ()