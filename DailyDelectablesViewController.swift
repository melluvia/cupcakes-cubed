//
//  DailyDelectablesViewController.swift
//  cupcakes-cubed
//
//  Created by Melissa Phillips on 10/6/16.
//  Copyright © 2016 Melissa Phillips Design. All rights reserved.
//

import UIKit

class DailyDelectablesViewController: UIViewController, UITableViewDataSource {

	@IBOutlet weak var tableView: UITableView!

	let delectablesSections = [
		"Monday",
		"Tuesday",
		"Wednesday",
		"Thursday",
		"Friday",
		"Saturday",
		"Sunday"
	]
	
	let dataForSection1 = [
		"Dolce De Leche",
		"Butterscotch",
		"Peanut Butter and Jelly",
		]
	
	let dataForSection2 = [
		"Peanut Butter Cup",
		"The Hawaiian",
		"Dolce De Leche",
		]
	
	let dataForSection3 = [
		"Dolce De Leche",
		"Butterscotch",
		"Peanut Butter Cup",
	]
	
	let dataForSection4 = [
		"Blue Passion",
		"Grandma's Apple Pie",
		"Peanut Butter Cup",
	]
	
	let dataForSection5 = [
		"Busy Bee",
		"Raspberry Rhapsody",
	]
	
	let dataForSection6 = [
		"Key Lime Pie",
		"Raspberry Rhapsody"
	]
	
	let dataForSection7 = [
		"Banana Rama",
		"Key Lime Pie",
		"Grandma's Apple Pie",
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
		return delectablesSections.count
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		
		return delectablesSections[section]
	}
	
	// From UITableViewDataSource protocol.
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		if section == 0 {
			return dataForSection1.count
		} else if section == 1 {
			return dataForSection2.count
		} else if section == 2 {
			return dataForSection3.count
		} else if section == 3 {
			return dataForSection4.count
		} else if section == 4 {
			return dataForSection5.count
		} else if section == 5 {
			return dataForSection6.count
		} else if section == 6 {
			return dataForSection7.count
		}
		
		return 0
	}
	
	// From UITableViewDataSource protocol.
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "dailyDelectablesCell", for: indexPath) as UITableViewCell
		
		if (indexPath as NSIndexPath).section == 0 {
			cell.textLabel?.text = dataForSection1[(indexPath as NSIndexPath).row]
		} else if (indexPath as NSIndexPath).section == 1 {
			cell.textLabel?.text = dataForSection2[(indexPath as NSIndexPath).row]
		} else if (indexPath as NSIndexPath).section == 2 {
			cell.textLabel?.text = dataForSection3[(indexPath as NSIndexPath).row]
		} else if (indexPath as NSIndexPath).section == 3 {
			cell.textLabel?.text = dataForSection4[(indexPath as NSIndexPath).row]
		} else if (indexPath as NSIndexPath).section == 4 {
			cell.textLabel?.text = dataForSection5[(indexPath as NSIndexPath).row]
		} else if (indexPath as NSIndexPath).section == 5 {
			cell.textLabel?.text = dataForSection6[(indexPath as NSIndexPath).row]
		} else if (indexPath as NSIndexPath).section == 6 {
			cell.textLabel?.text = dataForSection7[(indexPath as NSIndexPath).row]
		}
		
		return cell
	}
	
}
