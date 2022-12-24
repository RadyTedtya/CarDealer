//
//  ViewController.swift
//  CarDealer
//
//  Created by Tedtya rady on 30/1/22.
//

import UIKit

class CarListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var model = CarModel()
    var selectedType:CarType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCarDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let car = model.cars(forType: selectedType)[indexPath.row]
                let detailVC = segue.destination as? CarDetailViewController
                detailVC?.car = car
            }
        }else if segue.identifier == "addCarDealer"{
            let navVC = segue.destination as? UINavigationController
            let addVC =  navVC?.viewControllers.first as? AddCarViewController
            addVC?.delegate = self 
            
        }
    }

    @IBAction func didChangeFilter(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0:
            selectedType = nil
        case 1:
            selectedType = .petrol
        case 2:
            selectedType = .diesel
        case 3:
            selectedType = .electric
        default:
            break;
        }
        tableView.reloadData()
    }
    

}

extension CarListViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.cars(forType: selectedType).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath)
        let car = model.cars(forType: selectedType)[indexPath.row]
        
        cell.textLabel?.text = car.name
        cell.detailTextLabel?.text = car.locations
        cell.imageView?.image = UIImage(named: car.thumbnailName)
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
    }
    
}


extension CarListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension CarListViewController: AddCarDelegate {
    func add(car: Car) {
        model.add(car: car)
        tableView.reloadData()
    }
}

