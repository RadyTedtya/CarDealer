//
//  AddCarViewController.swift
//  CarDealer
//
//  Created by Tedtya rady on 9/2/22.
//

import UIKit


protocol AddCarDelegate{
    func add(car: Car)
}

class AddCarViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextView: UITextView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var type: String!
    let data = ["petrol","diesel","electric"]
    let locationsPlaceHolder = "Add locations"
    
    var delegate: AddCarDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        locationTextView.text = locationsPlaceHolder
        locationTextView.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    @IBAction func didTapCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func didTapSave(_ sender: Any) {
        guard let name = nameTextField.text else {return}        
        
        var newCarDealer = Car(name: name, locations: locationTextView.text, thumbnailName: "CarResources/sample_car.jpg", type: .petrol, imageName: "CarResources/sample_car.jpg")
        if type == "petrol"{
            newCarDealer.type = .petrol
        } else if type == "diesel"{
            newCarDealer.type = .diesel
        } else if type == "electric"{
            newCarDealer.type = .electric
        }
        
        delegate?.add(car: newCarDealer)
        dismiss(animated: true)
    
    }
}

extension AddCarViewController: UITextViewDelegate{
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.tertiaryLabel{
            textView.text = nil
            textView.textColor = UIColor.label
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty{
            textView.text = locationsPlaceHolder
            textView.textColor = UIColor.tertiaryLabel
        }
    }
    
}

extension AddCarViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
}
extension AddCarViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        type = data[row]
    }
}
