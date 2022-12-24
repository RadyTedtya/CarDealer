//
//  CarModel.swift
//  CarDealer
//
//  Created by Tedtya rady on 31/1/22.
//

import Foundation

class FavCarModel{
    private(set) var cars : [Car] = []
    
    func favCars(forType type: CarType?) ->[Car]{
        guard let type = type else { return  cars }
        return cars.filter{$0.type == type}
    }
     
    func add(car: Car){ 
        cars.append(car)
    }
    
}
