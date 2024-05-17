//
//  MapViewController.swift
//  JRNL-CodeOnly
//
//  Created by JIHYE SEOK on 5/13/24.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager: CLLocationManager = CLLocationManager()
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        return mapView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLocation()
        
        // Do any additional setup after loading the view.
    }
    
    private func setupLocation() {
        //setup LocationManager
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }
    
    private func setupUI() {
        //mapView settings
        self.mapView.isRotateEnabled = true
        self.mapView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.mapView)
        self.view.backgroundColor = .white
        self.navigationItem.title = "Map"
        
        NSLayoutConstraint.activate([
            self.mapView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            self.mapView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            self.mapView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.mapView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    // MARK: - CLLocationDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let myCurrentLocation = locations.first {
            let lat = myCurrentLocation.coordinate.latitude
            let lon = myCurrentLocation.coordinate.longitude
            
            mapView.region = MKCoordinateRegion (center: CLLocationCoordinate2D(latitude: lat, longitude: lon), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
    
}
