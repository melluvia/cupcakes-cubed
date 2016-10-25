//
//  ShoppingCart.swift
//  cupcakes-cubed
//
//  Created by Melissa Phillips on 10/13/16.
//  Copyright © 2016 Melissa Phillips Design. All rights reserved.
//

import Foundation

class ShoppingCart {

	// This gives access to the one and only instance.
	static let sharedInstance = ShoppingCart()
	
	// This prevents others from using the default '()' initializer for this class.
	private init() {
		
		self.items = [OrderData]()
	}
	
//	static let sharedInstance : ShoppingCart = {
//		let instance = ShoppingCart(array: [])
//		return instance
//	}()
	
	//MARK: Local Variable

	var items : [OrderData]

	var total: Double {

		var total = 0.0
		
		for item in self.items {
			
			total += item.price
		}
		
		return total
	}
	
	//MARK: Init
	
//	init( array : [String]) {
//		shoppingCartArray = array
//	}
}
