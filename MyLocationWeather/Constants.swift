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
    let lng = 36.2304
    let lat = 49.9935

    let BASE_SUNTIME_URL = "http://api.sunrise-sunset.org/json?lat=\(lat)&lng=\(lng)&date=today"



    typealias DownloadCompleted = () -> ()