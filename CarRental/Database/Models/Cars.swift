//
//  Cars.swift
//  CarRental
//
//  Created by Madiapps on 02/08/2022.
//

import RealmSwift

class Car: Object {
    @Persisted var car_ID : String
    @Persisted var car_number: String
    @Persisted var car_model: String
    @Persisted var car_status: String
    @Persisted var rent_prize: String
    @Persisted var driver_ID: String
    
    convenience init(car_number: String, car_model: String, car_status: String,rent_prize: String,driver_ID: String) {
        self.init()
        self.car_number = car_number
        self.car_model = car_model
        self.car_status = car_status
        self.rent_prize = rent_prize
        self.driver_ID = driver_ID
    }
}
