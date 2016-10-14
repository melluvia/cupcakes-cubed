//
//  AboutUsViewController.swift
//  cupcakes-cubed
//
//  Created by Melissa Phillips on 10/5/16.
//  Copyright © 2016 Melissa Phillips Design. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {
	
	@IBOutlet weak var aboutLabel: UILabel!
	
	func aboutLabelChange() {
		
		aboutLabel.lineBreakMode = .byWordWrapping // or NSLineBreakMode.ByWordWrapping
		aboutLabel.numberOfLines = 10
	}

}
