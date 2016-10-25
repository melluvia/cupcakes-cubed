//
//  OrderViewController.swift
//  cupcakes-cubed
//
//  Created by Melissa Phillips on 10/4/16.
//  Copyright © 2016 Melissa Phillips Design. All rights reserved.
//

import UIKit

class OrderTableViewController: UIViewController, UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate {

	@IBOutlet weak var tableView: UITableView!
	
	@IBOutlet weak var total: UILabel!
	//var order = ShoppingCart.sharedInstance.shoppingCartArray
	
	func onEditBtn(sender: UIBarButtonItem) {
		
		self.tableView.isEditing = !self.tableView.isEditing
	}
	
//	let order = ShoppingCart.sharedInstance.shoppingCartArray[(indexPath.row)]
	// MARK: Properties
	
	// Create a cache that uses keys of type NSString to point to types of UIImage.
	var imageCache = NSCache<NSString, UIImage>()
	var flavorCache = NSCache<NSString, UILabel>()
	//var amountCache
	//var priceCache


	override func viewDidLoad() {
		super.viewDidLoad()

		imageCache.countLimit = 50 // Cache up to 50 UIImage(s)

		let img = UIImage(named: "edit-symbol")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)

		// Use the edit button item provided by the table view controller.
		let rightBarButtonItem = UIBarButtonItem(image: img,
		                                        style: UIBarButtonItemStyle.plain,
		                                        target: self,
		                                        action: #selector(onEditBtn(sender:)))
		
		
		self.navigationItem.rightBarButtonItem = rightBarButtonItem
		
		self.tableView.reloadData()
		
		if loadOrderFromArchiver() != nil {
		
			ShoppingCart.sharedInstance.items += loadOrderFromArchiver()!
		} else {
			
			let alertController = UIAlertController(title: "Apologies!", message: "We're having trouble showing your order right now. Please try again later.", preferredStyle: .alert)
			
			let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
			alertController.addAction(defaultAction)
			
			present(alertController, animated: true, completion: nil)
			
		}

		let formatter = NumberFormatter()
		formatter.numberStyle = .currency
		total.text = formatter.string(from: ShoppingCart.sharedInstance.total as NSNumber)
//		total.text = String(ShoppingCart.sharedInstance.total)
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
		
		return ShoppingCart.sharedInstance.items.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		// Table view cells are reused and should be dequeued using a cell identifier.
		let cellIdentifier = "orderTableViewCell"
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! OrderTableViewCell
		
		// Fetches the appropriate order for the data source layout.
		let order = ShoppingCart.sharedInstance.items[(indexPath as NSIndexPath).row]
		
		cell.flavorLabel.text = order.flavor
		
		cell.photoImageView.image = order.image
		
		cell.amountLabel.text = String(describing: order.amount)
		
		let formatter = NumberFormatter()
		
		formatter.numberStyle = .currency
		
		cell.priceLabel.text = (formatter.string(from: order.price as NSNumber))
		
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
	
	// Override to support editing the table view.
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//		let order = ShoppingCart.sharedInstance.shoppingCartArray[(indexPath as NSIndexPath).row]
		if editingStyle == .delete {
			
			// Find the OrderData in the data source that we wish to delete.
			//let orderToRemove = order[indexPath.row]
			
			tableView.beginUpdates()
			// Delete the row from the data source
			ShoppingCart.sharedInstance.items.remove(at: (indexPath as NSIndexPath).row)
				
			// Save the meals.
			saveOrderToArchiver()
			
			tableView.deleteRows(at: [indexPath], with: .fade)
			
			tableView.endUpdates()
		}
	}
	
	// MARK: NSCoding
	
	func saveOrderToArchiver() {
		
		let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(ShoppingCart.sharedInstance.items, toFile: OrderData.ArchiveURL.path)
		
		if !isSuccessfulSave {
			print("Failed to save orders...")
		}
	}
	
	func loadOrderFromArchiver() -> [OrderData]? {
		
		return NSKeyedUnarchiver.unarchiveObject(withFile: OrderData.ArchiveURL.path) as? [OrderData]
	}



//		if imageCache.object(forKey: order.itemPhoto as NSString) != nil {
//				
//				// If the URL for the thumbnail is in the cache already - get the UIImage that belongs to it.
//				cell.photoImageView.image = imageCache.object(forKey: order.itemPhoto! as NSString)
//				
//		}
}





