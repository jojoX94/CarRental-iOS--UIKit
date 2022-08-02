//
//  Rentals.swift
//  CarRental
//
//  Created by Madiapps on 02/08/2022.
//

import RealmSwift
import Foundation

class Rental: Object {
    @Persisted var rental_ID : String
    @Persisted var rental_num: String
    @Persisted var date_rent: Date
    @Persisted var time_depart: String
    @Persisted var time_arrive: String
    @Persisted var destination: String
    @Persisted var date_return: Date
    @Persisted var payment: String
    
    convenience init(rental_num: String, date_rent: Date, time_depart: String,time_arrive: String,destination: String,date_return: Date, payment: String) {
        self.init()
        self.rental_num = rental_num
        self.date_rent = date_rent
        self.time_depart = time_depart
        self.time_arrive = time_arrive
        self.destination = destination
        self.date_return = date_return
        self.payment = payment
    }
}
