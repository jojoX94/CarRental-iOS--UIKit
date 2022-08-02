//
//  Customer.swift
//  CarRental
//
//  Created by Madiapps on 02/08/2022.
//

import RealmSwift

class Customer: Object {
    @Persisted var cust_ID : String
    @Persisted var fname: String
    @Persisted var lname: String
    @Persisted var gender: String
    @Persisted var age: Int
    @Persisted var contact_add: String
    @Persisted var cust_email: String
    @Persisted var cust_pass: String
    
    convenience init(fname: String, lname: String, gender: String,age: Int,contact_add: String,cust_email: String,cust_pass: String) {
        self.init()
        self.fname = fname
        self.lname = lname
        self.gender = gender
        self.age = age
        self.contact_add = contact_add
        self.cust_email = cust_email
        self.cust_pass = cust_pass
    }
}
