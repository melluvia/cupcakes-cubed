//
//  OrderConfirmationViewController.swift
//  cupcakes-cubed
//
//  Created by Melissa Phillips on 10/4/16.
//  Copyright © 2016 Melissa Phillips Design. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	

	@IBOutlet weak var tableView: UITableView!
	
	@IBOutlet weak var total: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.tableView.reloadData()
		
		if loadOrderFromArchiver() != nil {
			
			ShoppingCart.sharedInstance.items += loadOrderFromArchiver()!

		}
		
		let formatter = NumberFormatter()
		formatter.numberStyle = .currency
		total.text = formatter.string(from: ShoppingCart.sharedInstance.total as NSNumber)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()

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
		let cellIdentifier = "orderConfirmationTableViewCell"
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! OrderConfirmationTableViewCell
		
		// Fetches the appropriate order for the data source layout.
		let order = ShoppingCart.sharedInstance.items[(indexPath as NSIndexPath).row]
		
		cell.flavorTitle.text = order.flavor
		
		cell.photoImageView.image = order.image
		
		cell.amount.text = String(describing: order.amount)
		
		let formatter = NumberFormatter()
		
		formatter.numberStyle = .currency
		
		cell.price.text = (formatter.string(from: order.price as NSNumber))
		
		return cell
	}
	
	func loadOrderFromArchiver() -> [OrderData]? {
		
		return NSKeyedUnarchiver.unarchiveObject(withFile: OrderData.ArchiveURL.path) as? [OrderData]
	}
	
}





