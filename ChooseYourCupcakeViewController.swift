//
//  ChooseYourCupcakesViewController.swift
//  cupcakes-cubed
//
//  Created by Melissa Phillips on 9/29/16.
//  Copyright © 2016 Melissa Phillips Design. All rights reserved.
//

import UIKit


class ChooseYourCupcakesViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
	
	@IBOutlet weak var cupcakeView: UIImageView!
	@IBOutlet weak var addToBagBtn: UIButton!
	@IBOutlet weak var PickerView: UIPickerView!
	@IBOutlet weak var price: UILabel!
	@IBOutlet weak var saveSpinner: UIActivityIndicatorView!
	
	var order: OrderData?
	
	var flavorTitles = ["Chocolate", "Wedding Cake", "Red Velvet", "Lemon Drop", "tuxedo", "Oreo", "Carrot Cake", "Vanilla Chocolate", "The French Riviera", "Peanut Butter and Jelly", "Black Raspberry Chip", "Almond Creme", "Vanilla Wafer", "Snickerdoodle"]
	var amountNumber = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
	var flavorsComponent = 1
	var amountComponent = 2
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		saveSpinner.isHidden = true
		addToBagBtn.isEnabled = false
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()

	}
	
	//how to disable save button until pickerview is used?
//	func textFieldDidBeginEditing(_ textField: UITextField) {
//		// Disable the Save button while editing.
//		saveButton.isEnabled = false
//	}
	
	// From the UIPickerViewDataSource protocol.
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		
		return 2
	}
	
	// From the UIPickerViewDataSource protocol.
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		if component == flavorsComponent {
			return flavorTitles.count
		} else {
			return amountNumber.count
		}
	}
	
	// From the UIPickerViewDataSource protocol.
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		if component == flavorsComponent {
			return flavorTitles[row]
		} else {
			return String(amountNumber[row])
		}
		
	}
	
	// From the UIPickerViewDelegate protocol.
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		
		addToBagBtn.isEnabled = true
		
		if component == flavorsComponent {
			switch row {
			case 0: cupcakeView.image = #imageLiteral(resourceName: "chocolate-cupcake")
			case 1: cupcakeView.image = #imageLiteral(resourceName: "wedding-cake-cupcake")
			case 2: cupcakeView.image = #imageLiteral(resourceName: "red-velvet-cupcake")
			case 3: cupcakeView.image = #imageLiteral(resourceName: "lemon-drop-cupcake")
			case 4: cupcakeView.image = #imageLiteral(resourceName: "tuxedo-cupcake")
			case 5: cupcakeView.image = #imageLiteral(resourceName: "oreo-cupcake")
			case 6: cupcakeView.image = #imageLiteral(resourceName: "carrot-cake-cupcake")
			case 7: cupcakeView.image = #imageLiteral(resourceName: "vanilla-chocolate-cupcake")
			case 8: cupcakeView.image = #imageLiteral(resourceName: "french-riviera-cupcake")
			case 9: cupcakeView.image = #imageLiteral(resourceName: "pbjcupcake")
			case 10: cupcakeView.image = #imageLiteral(resourceName: "berry-chocolate-cupcake")
			case 11: cupcakeView.image = #imageLiteral(resourceName: "almond-creme-cupcake")
			case 12: cupcakeView.image = #imageLiteral(resourceName: "vanilla-wafer-cupcake")
			case 13: cupcakeView.image = #imageLiteral(resourceName: "snickerdoodle-cupcake")
			default: cupcakeView.image = #imageLiteral(resourceName: "french-riviera-cupcake")
			}
			
		} else {
			return
		}
		
		//need to cache selections and put in the singleton of the cart.
	}

	@IBAction func addToBag(_ sender: UIButton) {
		addToBagBtn.isEnabled = false
		
		let flavor = flavorTitles.description
		let amount = amountNumber.description
		let price = self.price.description
		
		saveSpinner.isHidden = false
		saveSpinner.startAnimating()
		
		if order == nil {
			order = OrderData(flavor: flavor, amount: Int(amount)!, price: Double(price)!)
		} else {
			order?.flavorTitle = flavor
			order?.itemAmount = Int(amount)!
			order?.price = Double(price)!
		}
		
		self.performSegue(withIdentifier: "unwindToMyBag", sender: self)
	}
}




