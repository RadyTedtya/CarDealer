//
//  CarModel.swift
//  CarDealer
//
//  Created by Tedtya rady on 31/1/22.
//

import Foundation

class CarModel{
    private(set) var cars : [Car] = []
    
    init(){
        if let url = Bundle.main.url(forResource: "CarResources/cars", withExtension: "json"){
            do{
                let data = try Data (contentsOf: url);
                cars = try JSONDecoder().decode([Car].self, from: data);
            }catch{
                print(error)
            }
        }
    }
     
    func cars(forType type: CarType?) ->[Car]{
        guard let type = type else { return  cars }
        return cars.filter{$0.type == type}
    }
     
    func add(car: Car){
        cars.append(car)
    }
    
}
