//
//  DayNightImg.swift
//  MyLocationWeather
//
//  Created by Valentina Butenko on 4/9/16.
//  Copyright © 2016 Valentina Butenko. All rights reserved.
//

import Foundation
import UIKit


class DayNightImg: UIImageView{
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    func SelectImage(town: Weather){
        
        // taking the current sunrise & sunset dates
        
        let eveningTime = String(town.sunset.characters.prefix(2))

        let morningTime = String(town.sunrise.characters.prefix(2))
        
        let finalEveningTime = eveningTime.stringByReplacingOccurrencesOfString(":", withString: "")
        let finalMorningTime = morningTime.stringByReplacingOccurrencesOfString(":", withString: "")
        
        // getting current hour
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Hour, fromDate: date)
        let hour = components.hour
        
        if let evening = Int(finalEveningTime){
            
            // checking if current hour is PM & comparing is to sunset time from API
            if hour >= (evening + 12){
                
                return self.image = UIImage(named: "day2.png")
            }
        }
        
        // checking if current time is AM
        if let morning = Int(finalMorningTime){
                
            if hour < 12 && hour <= morning{

                return self.image = UIImage(named: "day1.png")
            }
        }
        
    }

}