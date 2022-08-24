//
//  Brand.swift
//  CarRental
//
//  Created by Madiapps on 16/08/2022.
//

import Foundation
import RealmSwift

class Brand: Object {
    @Persisted var name = ""
    @Persisted var imageUrl: String
    
    convenience init(name: String, imageUrl: String) {
        self.init()
        self.name = name
        self.imageUrl = imageUrl
    }
    
    static func getAll() -> [Brand]? {
        do {
            let realm = try Realm()
            let objects = realm.objects(Brand.self)
            if objects.count > 0 {
                return Array(objects)
            }
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
        return nil
    }
    
    static func getByName(name: String) -> Brand? {
        do {
            let realm = try Realm()
            let object = realm.objects(Brand.self).where {
                $0.name == name
            }.first
            
            if object != nil {
                return object
            }
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
        return nil
    }
    
    static let defaultBrands = [
            Brand(name: "lambo", imageUrl: "https://www.carlogos.org/car-logos/lamborghini-logo.png"),
            Brand(name: "benz", imageUrl: "https://www.carlogos.org/car-logos/mercedes-benz-logo.png"),
            Brand(name: "porsche", imageUrl: "https://www.carlogos.org/car-logos/porsche-logo.png"),
            Brand(name: "bmw", imageUrl: "https://www.carlogos.org/car-logos/bmw-logo.png"),
            Brand(name: "ferrari", imageUrl: "https://www.carlogos.org/car-logos/ferrari-logo.png"),
            Brand(name: "ford", imageUrl: "https://www.carlogos.org/car-logos/ford-logo.png"),
            Brand(name: "audi", imageUrl: "https://www.carlogos.org/car-logos/audi-logo.png")
    ]
}
