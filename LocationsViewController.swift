//
//  LocationsViewController.swift
//  cupcakes-cubed
//
//  Created by Melissa Phillips on 10/6/16.
//  Copyright © 2016 Melissa Phillips Design. All rights reserved.
//

import UIKit
import MapKit

class LocationsViewController: UIViewController, MKMapViewDelegate {
	

	@IBOutlet weak var mapView: MKMapView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let location = CLLocationCoordinate2D(latitude: 33.173685, longitude: -96.841937)
		let span = MKCoordinateSpanMake(0.05, 0.05)
		
		let region = MKCoordinateRegion(center: location, span: span)
		
		mapView.setRegion(region, animated: true)
		
		let annotation = MKPointAnnotation()
		annotation.coordinate = location
		annotation.title = "Cupcakes Cubed"
		annotation.subtitle = "Original Frisco Location"
		
		mapView.addAnnotation(annotation)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
		print("mapViewDidFinishRenderingMap: \(fullyRendered)")
	}
	
	@IBAction func onValueChangedSegment(_ sender: UISegmentedControl) {
		
		switch sender.selectedSegmentIndex {
		case 0:
			mapView.mapType = MKMapType.standard
		case 1:
			mapView.mapType = MKMapType.satellite
		case 2:
			mapView.mapType = MKMapType.hybrid
		//setUpCamera()
		default:
			break
		}
		
	}
	
	fileprivate func setUpCamera() {
		mapView.camera.altitude = 1500
		mapView.camera.pitch = 60
		mapView.camera.heading = 180
	}
	
	@IBAction func onShowTrafficBtn(_ sender: UIButton) {
		
		mapView.showsTraffic = !mapView.showsTraffic
		
		if(mapView.showsTraffic == true) {
			sender.setTitle("Hide Traffic", for: UIControlState())
		} else {
			sender.setTitle("Show Traffic", for: UIControlState())
		}
	}
	
	@IBAction func onShowCompassBtn(_ sender: UIButton) {
		
		mapView.showsCompass = !mapView.showsCompass
		
		if(mapView.showsCompass == true) {
			sender.setTitle("Hide Compass", for: UIControlState())
		} else {
			sender.setTitle("Show Compass", for: UIControlState())
		}
	}
	
}
