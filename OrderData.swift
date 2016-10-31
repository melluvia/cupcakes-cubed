//
//  OrderData.swift
//  food-tracker
//
//  Created by Melissa Phillips on 9/15/16.
//  Copyright © 2016 Melissa Phillips Design. All rights reserved.
//

import UIKit

class OrderData: NSObject, NSCoding {
	
	var flavor: String
	var amount: Int
	var price: Double
	var image: UIImage

	
	// MARK: Archiving Paths
 
	static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
	static let ArchiveURL = DocumentsDirectory.appendingPathComponent("orders")
	
	// MARK: Types
 
	struct PropertyKey {
		
		static let flavorKey = "flavor"
		static let amountKey = "amount"
		static let priceKey = "price"
		static let photoKey = "image"
	}
	
	//	 MARK: Initialization

	init(flavor: String, amount: Int, price: Double, image: UIImage) {

		// Initialize stored properties.
		self.flavor = flavor
		self.amount = amount
		self.price = price
		self.image = image
	}
	
	//	 MARK: NSCoding
	
	func encode(with aCoder: NSCoder) {
		
		aCoder.encode(flavor, forKey: PropertyKey.flavorKey)
		aCoder.encode(amount, forKey: PropertyKey.amountKey)
		aCoder.encode(price, forKey: PropertyKey.priceKey)
		aCoder.encode(image, forKey: PropertyKey.photoKey)
		print(flavor)
	}
	
	required convenience init?(coder aDecoder: NSCoder) {
		
		let flavor = aDecoder.decodeObject(forKey: PropertyKey.flavorKey) as? String

		let amount = aDecoder.decodeObject(forKey: PropertyKey.amountKey) as? Int
		
		let price = aDecoder.decodeDouble(forKey: PropertyKey.priceKey)
		
		let image = aDecoder.decodeObject(forKey: PropertyKey.photoKey) as? UIImage
		
		if flavor == nil {
			return nil
		}
		
		if amount == nil {
			return nil
		}
		
		if image == nil {
			return nil
		}

		// Must call designated initializer.
		self.init(flavor: flavor!, amount: amount!, price: price, image: image!)

	}
}
