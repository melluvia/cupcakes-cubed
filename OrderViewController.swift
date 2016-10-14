//
//  ChooseYourCupcakesViewController.swift
//  cupcakes-cubed
//
//  Created by Melissa Phillips on 9/29/16.
//  Copyright © 2016 Melissa Phillips Design. All rights reserved.
//

import UIKit


class OrderViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
	
	@IBOutlet weak var cupcakeView: UIImageView!
	@IBOutlet weak var PickerView: UIPickerView!
	@IBOutlet weak var price: UILabel!
	@IBOutlet weak var saveSpinner: UIActivityIndicatorView!
	
	var order: OrderData?
	
	var priceAmount: Double = 0.0
	
	var flavorTitles = ["Chocolate", "Wedding Cake", "Red Velvet", "Lemon Drop", "tuxedo", "Oreo", "Carrot Cake", "Vanilla Chocolate", "The French Riviera", "Peanut Butter and Jelly", "Black Raspberry Chip", "Almond Creme", "Vanilla Wafer", "Snickerdoodle"]
	var amountNumber = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
	var flavorsComponent = 1
	var amountComponent = 2
	
	var currentFlavor = ""
	
	
	let formatter = NumberFormatter()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		saveSpinner.isHidden = true

		
		price.text = "$3.50"
		priceAmount = 3.5
		cupcakeView.image = #imageLiteral(resourceName: "chocolate-cupcake")
		
		formatter.numberStyle = .currency
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()

	}
	
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
			
			priceAmount = 3.50 * Double(amountNumber[row])
			price.text = formatter.string(from: priceAmount as NSNumber)
		}
		
	}

	@IBAction func addOrder(_ sender: UIButton) {
				
		let image = cupcakeView.image
		let amount = PickerView.selectedRow(inComponent: 0)
		let flavor = String(PickerView.selectedRow(inComponent: 1))
		let price = priceAmount //Double(self.price.text ?? "")
		
		order = OrderData(flavor: flavor, amount: amount, price: price, image: image!)
		
		if let order = order {
			
			ShoppingCart.sharedInstance.shoppingCartArray.append(order)
			
			self.performSegue(withIdentifier: "gotoMyOrder", sender: self)
			
		} else {
			// TOOO: Alert
		}


	}
}




