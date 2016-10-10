//
//  MyBag.swift
//  cupcakes-cubed
//
//  Created by Melissa Phillips on 10/7/16.
//  Copyright © 2016 Melissa Phillips Design. All rights reserved.
//

class MyBag  {
	
	static let sharedInstance = MyBag()
	let appName:String = "Cupcakes-Cubed"
	var price: Double = 2.99
	var amount: Int?
	func sales() -> Double {
		if let total = amount {
			return Double(total) * price
		} else {
			return 0
		}
	}
	
	func saveCupcakeData() {
	
		let newOrder = Order()
		newOrder.flavorTitle = ""
		newOrder.itemAmount = amount!
		newOrder.price = price
	}
}

//	let nameOfApp = Singleton.sharedInstance.appName
//	print(nameOfApp) // will print a string: "Shopping Cart Tracker"
//	
//	Singleton.sharedInstance.downloads = 1000
//	print("Sales: $\(Singleton.sharedInstance.sales())") \\ will print the string: "Sales: $990".
