//
//  MenuViewController.swift
//  cupcakes-cubed
//
//  Created by Melissa Phillips on 10/5/16.
//  Copyright © 2016 Melissa Phillips Design. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource {
	
	@IBOutlet weak var tableView: UITableView!
	

	
	let menuSections = [
		"Prices",
		"Signature Cupcakes",
		"Infused Cupcakes"
		]
	
	let dataForSection1 = [
		"Signature & Infused Cupcakes",
		"$3.50 each",
		"Dozen Cupcakes or more",
		"$3.25 each",
		"Mini Cupcakes",
		"$1.75 (two dozen minimum per flavor)",
	]
	
	let dataForSection2 = [
		"Wedding Cake",
		"Vanilla Chocolate",
		"Red Velvet",
		"Ultimate Chocolate",
		"The Tuxedo",
		"Snickerdoodle",
		"Oreo Overload",
		"Banana Rama",
		"Carrot Cake",
		"Lemon Drop",
		"Strawberry Passion",
		"The Hawaiian",
		"Blue Passion",

	]
	let dataForSection3 = [
		"PB & J",
		"Dolce De Leche",
		"Boston Crème Pie",
		"Butterscotch",
		"French Riviera",
		"Grandma’s Apple Pie",
		"Coconut Crème Dream",
		"Busy Bee",
		"Raspberry Rhapsody",
		"Stuffed Cookie Dough",
		"Chocolate Mallow",
		"Peanut Butter Cup",
		"Key Lime Pie"
	]
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		// This sample sets the dataSource and delegate in the StoryBoard, but you may
		// see some code samples where they're set here in code like so.
		//tableView.delegate = self
		//tableView.dataSource = self
	}
	
	override func didReceiveMemoryWarning() {
		
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// From UITableViewDataSource protocol.
	func numberOfSections(in tableView: UITableView) -> Int {
		
		// We only have one section in our table view.
		return menuSections.count
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		
		return menuSections[section]
	}
	
	// From UITableViewDataSource protocol.
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		if section == 0 {
			return dataForSection1.count
		} else if section == 1 {
			return dataForSection2.count
		} else if section == 2 {
			return dataForSection3.count
		}
		
		return 0
	}

	// From UITableViewDataSource protocol.
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "menuTableCell", for: indexPath) as UITableViewCell
		
		if (indexPath as NSIndexPath).section == 0 {
			cell.textLabel?.text = dataForSection1[(indexPath as NSIndexPath).row]
		} else if (indexPath as NSIndexPath).section == 1 {
			cell.textLabel?.text = dataForSection2[(indexPath as NSIndexPath).row]
		} else if (indexPath as NSIndexPath).section == 2 {
			cell.textLabel?.text = dataForSection3[(indexPath as NSIndexPath).row]
		}
		
		return cell
	}

}
