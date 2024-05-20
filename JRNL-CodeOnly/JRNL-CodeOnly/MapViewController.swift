//
//  MapViewController.swift
//  JRNL-CodeOnly
//
//  Created by JIHYE SEOK on 5/13/24.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    let locationManager: CLLocationManager = CLLocationManager()
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.delegate = self
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        return mapView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLocation()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        locationManager.requestLocation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SharedData.shared.loadJournalEntriesData()
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
        self.view.backgroundColor = .white
        self.mapView.isRotateEnabled = true
        self.mapView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.mapView)
        self.navigationItem.title = "Map"
        
        NSLayoutConstraint.activate([
            self.mapView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor),
            self.mapView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor),
            self.mapView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            self.mapView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    // MARK: - CLLocationDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let myCurrentLocation = locations.first {
            let lat = myCurrentLocation.coordinate.latitude
            let lon = myCurrentLocation.coordinate.longitude
            
            mapView.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: lon), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            
            mapView.addAnnotations(SharedData.shared.getAllJournalEntries())
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
    
    // MARK: - MKMapViewDelegate
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        let identifier = "mapAnnotation"
        if annotation is JournalEntry {
            if let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) {
                annotationView.annotation = annotation
                return annotationView
            } else {
                let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView.canShowCallout = true
                let calloutButton = UIButton(type: .detailDisclosure)
                annotationView.rightCalloutAccessoryView = calloutButton
                return annotationView
            }
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let journalEntry = view.annotation as? JournalEntry {
            let journalDetailViewController = JournalDetailViewController(journalEntry: journalEntry)
            show(journalDetailViewController, sender: nil)
        }
    }
}
