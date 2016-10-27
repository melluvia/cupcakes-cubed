//
//  Artwork.swift
//  cupcakes-cubed
//
//  Created by Melissa Phillips on 10/27/16.
//  Copyright © 2016 Melissa Phillips Design. All rights reserved.
//

import Foundation
import MapKit

class Artwork: NSObject, MKAnnotation {
	let title: String?
	let locationName: String
	let discipline: String
	let coordinate: CLLocationCoordinate2D
 
	init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
		self.title = title
		self.locationName = locationName
		self.discipline = discipline
		self.coordinate = coordinate
		
	}
}
