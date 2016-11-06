//
//  OrderConfirmationTableViewCell.swift
//  cupcakes-cubed
//
//  Created by Melissa Phillips on 11/6/16.
//  Copyright © 2016 Melissa Phillips Design. All rights reserved.
//

import UIKit

class OrderConfirmationTableViewCell: UITableViewCell {
	
	// MARK: Properties
	

	@IBOutlet weak var price: UILabel!
	@IBOutlet weak var flavorTitle: UILabel!
	@IBOutlet weak var amount: UILabel!
	@IBOutlet weak var photoImageView: UIImageView!

	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
}
