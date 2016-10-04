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
	
	
	var pickerTitles = ["Chocolate", "Wedding Cake", "Red Velvet", "Lemon Drop", "tuxedo", "Oreo", "Carrot Cake", "Reese's"];
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// From the UIPickerViewDataSource protocol.
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		
		return 1
	}
	
	// From the UIPickerViewDataSource protocol.
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		
		return pickerTitles.count
	}
	
	// From the UIPickerViewDataSource protocol.
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		
		return pickerTitles[row]
	}
	
	// From the UIPickerViewDelegate protocol.
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		
		switch row {
		case 0: cupcakeView.image = #imageLiteral(resourceName: "chocolate-cupcake")
		case 1: cupcakeView.image = #imageLiteral(resourceName: "wedding-cake-cupcake")
		case 2: cupcakeView.image = #imageLiteral(resourceName: "red-velvet-cupcake")
		case 3: cupcakeView.image = #imageLiteral(resourceName: "lemon-drop-cupcake")
		case 4: cupcakeView.image = #imageLiteral(resourceName: "tuxedo-cupcake")
		case 5: cupcakeView.image = #imageLiteral(resourceName: "oreo-cupcake")
		case 6: cupcakeView.image = #imageLiteral(resourceName: "carrot-cake-cupcake")
		case 7: cupcakeView.image = #imageLiteral(resourceName: "reeses-cupcake")
		default: cupcakeView.image = #imageLiteral(resourceName: "chocolate-cupcake")
		}
	}
}


