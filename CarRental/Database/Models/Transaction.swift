//
//  Transaction.swift
//  CarRental
//
//  Created by Madiapps on 02/08/2022.
//

import RealmSwift
import Foundation

class Transaction: Object {
    @Persisted var trans_ID : String
    @Persisted var trans_name: String
    @Persisted var rental_ID: String
    @Persisted var car_ID: String
    @Persisted var cust_ID: String
    @Persisted var trans_date: Date
    
    convenience init(trans_name: String, rental_ID: String, car_ID: String,cust_ID: String,trans_date: Date) {
        self.init()
        self.trans_name = trans_name
        self.rental_ID = rental_ID
        self.car_ID = car_ID
        self.cust_ID = cust_ID
        self.trans_date = trans_date
    }
}
