//
//  Order.swift
//  cupcakes-cubed
//
//  Created by Melissa Phillips on 10/10/16.
//  Copyright © 2016 Melissa Phillips Design. All rights reserved.
//

import Foundation

class Order: NSObject {
	
	var flavorTitle: String?
	var itemAmount: Int = 0
	var price: Double = 0.0
	var itemPhoto: String?
	
	func printFlavor() {
		print(flavorTitle)
	}
}
