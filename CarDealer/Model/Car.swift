//
//  Car.swift
//  CarDealer
//
//  Created by Tedtya rady on 31/1/22.
//

import Foundation
import UIKit

struct Car: Decodable{

    var name: String
    var locations: String
    var thumbnailName: String
    var type:CarType
    var imageName:String

}

enum CarType:String, Decodable{
    case petrol = "petrol"
    case diesel = "diesel"
    case electric = "electric"
}
