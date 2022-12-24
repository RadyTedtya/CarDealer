//
//  FavouriteViewController.swift
//  CarDealer
//
//  Created by Tedtya rady on 10/2/22.
//

import UIKit

class FavouriteViewController: UIViewController{
    
    @IBOutlet weak var favouriteTableView: UITableView!

    var favModel = FavCarModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        favouriteTableView.dataSource = self
        favouriteTableView.delegate = self
    }

}

extension FavouriteViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favModel.cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favouriteTableView.dequeueReusableCell(withIdentifier: "favouriteCarCell", for: indexPath)
        let favCar = favModel.cars[indexPath.row]
    
        cell.textLabel?.text = favCar.name
        cell.detailTextLabel?.text = favCar.locations
        cell.imageView?.image = UIImage(named: favCar.thumbnailName)
        
        return cell;
    }
    

    func favouriteTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
    }
    
    
}


extension FavouriteViewController: UITableViewDelegate{
    func favouriteTableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension FavouriteViewController:  AddFavoriteCarDelegate{
    func addFavouriteCar(car: Car) {
        favModel.add(car: car)
        favouriteTableView.reloadData()
    }
}

  
