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
        Car(car_image: "https://cdn.jdpower.com/ChromeImageGallery/Expanded/Transparent/640/2022BMC74_640/2022BMC740017_640_01.png", car_number: "YDH-234", car_brand: "bmw", car_model: "4 series", car_status: "", rent_prize: "249"),
        Car(car_image: "https://cdn.jdpower.com/ChromeImageGallery/Expanded/Transparent/640/2022BMCA1_640/2022BMCA10014_640_01.png", car_number: "YDH-234", car_brand: "bmw", car_model: "i4", car_status: "", rent_prize: "103"),
        Car(car_image: "https://cdn.jdpower.com/ChromeImageGallery/Expanded/Transparent/640/2021BMC24_640/2021BMC240001_640_01.png", car_number: "YDH-234", car_brand: "bmw", car_model: "z4", car_status: "", rent_prize: "249"),
        Car(car_image: "https://cdn.jdpower.com/ChromeImageGallery/Expanded/Transparent/640/2022BMS26_640/2022BMS260001_640_01.png", car_number: "YDH-234", car_brand: "bmw", car_model: "x4m", car_status: "", rent_prize: "143"),
        Car(car_image: "https://cdn.jdpower.com/ChromeImageGallery/Expanded/Transparent/640/2021BMC11_640/2021BMC110001_640_01.png", car_number: "YDH-234", car_brand: "bmw", car_model: "m3", car_status: "", rent_prize: "249"),
        Car(car_image: "https://cdn.jdpower.com/ChromeImageGallery/Expanded/Transparent/640/2021BMS30_640/2021BMS300017_640_01.png", car_number: "YDH-234", car_brand: "bmw", car_model: "x3m", car_status: "", rent_prize: "249"),
        Car(car_image: "https://cdn.jdpower.com/ChromeImageGallery/Expanded/Transparent/640/2022AUC17_640/2022AUC170013_640_01.png", car_number: "YDH-234", car_brand: "audi", car_model: "r8-coupe", car_status: "", rent_prize: "249"),
        Car(car_image: "https://cdn.jdpower.com/ChromeImageGallery/Expanded/Transparent/640/2020CAS01_640/2020CAS010001_640_01.png", car_number: "YDH-234", car_brand: "ford", car_model: "4 series", car_status: "", rent_prize: "249"),
        Car(car_image: "https://cdn.jdpower.com/ChromeImageGallery/Expanded/Transparent/640/2020PRC01_640/2020PRC010001_640_01.png", car_number: "YDH-234", car_brand: "bmw", car_model: "911", car_status: "", rent_prize: "249"),
        Car(car_image: "https://cdn.jdpower.com/ChromeImageGallery/Expanded/Transparent/640/2021FOC05_640/2021FOC050001_640_01.png", car_number: "YDH-234", car_brand: "ford", car_model: "Mustang", car_status: "", rent_prize: "249"),
        Car(car_image: "https://cdn.jdpower.com/ChromeImageGallery/Expanded/Transparent/640/2021AUC02_640/2021AUC020017_640_01.png", car_number: "YDH-234", car_brand: "audi", car_model: "a6", car_status: "", rent_prize: "249"),
    ]
}

