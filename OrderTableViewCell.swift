//
//  MyBagTableCell.swift
//  cupcakes-cubed
//
//  Created by Melissa Phillips on 10/10/16.
//  Copyright © 2016 Melissa Phillips Design. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
	
	// MARK: Properties
	

	@IBOutlet weak var priceLabel: UILabel!
	@IBOutlet weak var photoImageView: UIImageView!
	@IBOutlet weak var flavorLabel: UILabel!
	@IBOutlet weak var saveSpinner: UIActivityIndicatorView!
	@IBOutlet weak var amountLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
}
