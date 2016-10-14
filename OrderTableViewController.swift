//
//  OrderViewController.swift
//  cupcakes-cubed
//
//  Created by Melissa Phillips on 10/4/16.
//  Copyright © 2016 Melissa Phillips Design. All rights reserved.
//

import UIKit

class OrderTableViewController: UIViewController, UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate {

	@IBOutlet weak var tax: UILabel!
	@IBOutlet weak var deliveryCost: UILabel!
	@IBOutlet weak var tableView: UITableView!

	// MARK: Properties
	
	// Create a cache that uses keys of type NSString to point to types of UIImage.
	var imageCache = NSCache<NSString, UIImage>()
	var flavorCache = NSCache<NSString, UILabel>()
	//var amountCache
	//var priceCache


	override func viewDidLoad() {
		super.viewDidLoad()

		imageCache.countLimit = 50 // Cache up to 50 UIImage(s)

		// Use the edit button item provided by the table view controller.
		navigationItem.leftBarButtonItem = editButtonItem

		//how to load the cached flavor, image, price and amout??

	}

//	func refresh(sender: AnyObject) {
//		self.orders = OrderData
//		self.tableView.reloadData()
//		self.refreshControl?.endRefreshing()
//	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// MARK: - Table view data source
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return ShoppingCart.sharedInstance.shoppingCartArray.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		// Table view cells are reused and should be dequeued using a cell identifier.
		let cellIdentifier = "orderTableViewCell"
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! OrderTableViewCell
		
		// Fetches the appropriate order for the data source layout.
		let order = ShoppingCart.sharedInstance.shoppingCartArray[(indexPath as NSIndexPath).row]
		
		cell.flavorLabel.text = order.flavor
		
		cell.photoImageView.image = order.image
		
		cell.amountLabel.text = String(describing: order.amount)
		
		cell.priceLabel.text = String(describing: order.price)
		
//		if imageCache.object(forKey: order.image as NSString) != nil {
//			
//			// If the URL for the photo is in the cache already - get the UIImage that belongs to it.
//			cell.photoImageView.image = imageCache.object(forKey: order.itemPhoto)! as NSString;)
//			cell.amountLabel.text = imageCache.object(forKey: order.itemAmount)! as NSString)
//			cell.flavorLabel.text = stringCache.object(forKey: order.flavorTitle)! as NSString)
//			cell.priceLabel.text = stringCache.object(forKey: order.price)! as NSString)
//		}
		
		return cell
	}

//		if imageCache.object(forKey: order.itemPhoto as NSString) != nil {
//				
//				// If the URL for the thumbnail is in the cache already - get the UIImage that belongs to it.
//				cell.photoImageView.image = imageCache.object(forKey: order.itemPhoto! as NSString)
//				
//		}
}

//add singleton to this




