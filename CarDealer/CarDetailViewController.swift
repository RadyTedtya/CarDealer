//
//  CarDetailViewController.swift
//  CarDealer
//
//  Created by Tedtya rady on 3/2/22.
//

import UIKit
import SwiftUI


protocol AddFavoriteCarDelegate{
    func addFavouriteCar(car: Car)
}

class CarDetailViewController: UIViewController {

    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var locationsTextView: UITextView!
    var car: Car!
    
    var favDelegate: AddFavoriteCarDelegate?
    let favVC = FavouriteViewController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerImageView.image = UIImage(named: car.imageName)
        nameLabel.text = car.name
        locationsTextView.text = bulletedList(forLocations: car.locations)
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
           tap.numberOfTapsRequired = 2
           view.addGestureRecognizer(tap)
    }
    

    
    private func bulletedList(forLocations locations: String) -> String{
        var list = ""
        let items = locations.split(separator: ",")
        items.forEach {list.append("\u{2022} \($0)\n")}
        return list
    }
    

    @objc func doubleTapped() {
        print("double Tapped")
        favDelegate?.addFavouriteCar(car: car)
        print("add", car.name, " to Favourite")
    }


    
}



