//
//  OrderData.swift
//  food-tracker
//
//  Created by Melissa Phillips on 9/15/16.
//  Copyright © 2016 Melissa Phillips Design. All rights reserved.
//

import UIKit

class OrderData: NSObject, NSCoding {
	
	var flavorTitle: String
	var itemAmount: Int
	var price: Double
	
	// MARK: Archiving Paths
 
	static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
	static let ArchiveURL = DocumentsDirectory.appendingPathComponent("orders")
	
	// MARK: Types
 
	struct PropertyKey {
		
		static let flavorKey = "flavor"
		static let amountKey = "amount"
		static let priceKey = "price"
	}
	
	//	 MARK: Initialization
 
	init?(flavor: String, amount: Int, price: Double) {
		
		// Initialize stored properties.
		self.flavorTitle = flavor
		self.itemAmount = amount
		self.price = price
		
		super.init()
		
		// Initialization should fail if there is no name or if the rating is negative.
		if flavor.isEmpty {
			return nil
		}
	}
	
	//	 MARK: NSCoding
	
	func encode(with aCoder: NSCoder) {
		
		aCoder.encode(flavorTitle, forKey: PropertyKey.flavorKey)
		aCoder.encode(itemAmount, forKey: PropertyKey.amountKey)
		aCoder.encode(price, forKey: PropertyKey.priceKey)
	}
	
	required convenience init?(coder aDecoder: NSCoder) {
		
		let flavor = aDecoder.decodeObject(forKey: PropertyKey.flavorKey) as! String

		let amount = aDecoder.decodeObject(forKey: PropertyKey.amountKey) as! Int
		
		let price = aDecoder.decodeInteger(forKey: PropertyKey.priceKey)
		
		
		// Must call designated initializer.
		self.init(flavor: flavor, amount: amount, price: Double(price))
	}
}
