//
//  Report.swift
//  CarRental
//
//  Created by Madiapps on 02/08/2022.
//

import RealmSwift
import Foundation

class Report: Object {
    @Persisted var report_ID : String
    @Persisted var trans_ID: String
    @Persisted var rental_ID: String
    @Persisted var report_date: Date
    
    convenience init(trans_ID: String, rental_ID: String, report_date: Date) {
        self.init()
        self.trans_ID = trans_ID
        self.rental_ID = rental_ID
        self.report_date = report_date
    }
}
