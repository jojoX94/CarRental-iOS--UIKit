//
//  Cars.swift
//  CarRental
//
//  Created by Madiapps on 02/08/2022.
//

import RealmSwift
import Foundation

class Car: Object {
    @Persisted var car_ID : String
    @Persisted var car_image: String
    @Persisted var car_number: String
    @Persisted var car_brand: String
    @Persisted var car_model: String
    @Persisted var car_status: String
    @Persisted var rent_prize: String
    @Persisted var driver: Driver?
    
    convenience init(car_image: String, car_number: String, car_brand: String, car_model: String, car_status: String,rent_prize: String) {
        self.init()
        self.car_image = car_image
        self.car_number = car_number
        self.car_brand = car_brand
        self.car_model = car_model
        self.car_status = car_status
        self.rent_prize = rent_prize
    }
    convenience init(car_image: String, car_number: String, car_brand: String, car_model: String, car_status: String,rent_prize: String,driver: Driver) {
        self.init()
        self.car_image = car_image
        self.car_number = car_number
        self.car_brand = car_brand
        self.car_model = car_model
        self.car_status = car_status
        self.rent_prize = rent_prize
        self.driver = driver
    }
    
    static func getAll() -> [Car]? {
        do {
            let realm = try Realm()
            let objects = realm.objects(Car.self)
            if objects.count > 0 {
                return Array(objects)
            }
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
        return nil
    }
    
    // Default value for tests
    static let defaultCars = [
        Car(car_image: "https://cdn.jdpower.com/models/320x240/2022-bmw-4series.jpg", car_number: "YDH-234", car_brand: "bmw", car_model: "4 series", car_status: "", rent_prize: "249"),
        Car(car_image: "https://cdn.jdpower.com/models/320x240/2022-bmw-i4.jpg", car_number: "YDH-234", car_brand: "bmw", car_model: "i4", car_status: "", rent_prize: "103"),
        Car(car_image: "https://cdn.jdpower.com/models/320x240/2022-bmw-z4.jpg", car_number: "YDH-234", car_brand: "bmw", car_model: "z4", car_status: "", rent_prize: "249"),
        Car(car_image: "https://cdn.jdpower.com/models/320x240/2022-bmw-x4m.jpg", car_number: "YDH-234", car_brand: "bmw", car_model: "x4m", car_status: "", rent_prize: "143"),
        Car(car_image: "https://cdn.jdpower.com/models/320x240/2022-bmw-m3.jpg", car_number: "YDH-234", car_brand: "bmw", car_model: "m3", car_status: "", rent_prize: "249"),
        Car(car_image: "https://cdn.jdpower.com/models/320x240/2022-bmw-x3m.jpg", car_number: "YDH-234", car_brand: "bmw", car_model: "x3m", car_status: "", rent_prize: "249"),
        Car(car_image: "https://cdn.jdpower.com/models/320x240/2022-bmw-x3m.jpg", car_number: "YDH-234", car_brand: "audi", car_model: "r8-coupe", car_status: "", rent_prize: "249"),
        Car(car_image: "https://cdn.jdpower.com/ChromeImageGallery/Expanded/Transparent/640/2020CAS01_640/2020CAS010001_640_01.png", car_number: "YDH-234", car_brand: "ford", car_model: "4 series", car_status: "", rent_prize: "249"),
        Car(car_image: "https://cdn.jdpower.com/Models/640x480/2019-Porsche-911.jpg", car_number: "YDH-234", car_brand: "bmw", car_model: "911", car_status: "", rent_prize: "249"),
        Car(car_image: "https://cdn.jdpower.com/Models/640x480/2012-Ford-Mustang.jpg", car_number: "YDH-234", car_brand: "ford", car_model: "Mustang", car_status: "", rent_prize: "249"),
        Car(car_image: "https://cdn.jdpower.com/models/400x200/2019-audi-a6.jpg", car_number: "YDH-234", car_brand: "audi", car_model: "a6", car_status: "", rent_prize: "249"),
    ]
}

