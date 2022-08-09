//
//  Driver.swift
//  CarRental
//
//  Created by Madiapps on 02/08/2022.
//

import RealmSwift

class Driver: Object {
    @Persisted var driver_ID : String
    @Persisted var driver_name: String
    @Persisted var commission: String
    
    convenience init(driver_name: String, commission: String) {
        self.init()
        self.driver_name = driver_name
        self.commission = commission
    }
}
