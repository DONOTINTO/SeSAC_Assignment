//
//  ViewController.swift
//  SeSAC_Assignment_0115
//
//  Created by 이중엽 on 1/15/24.
//

import UIKit
import MapKit

enum TheaterCase: CaseIterable {
    case lotte
    case megabox
    case cgv
    case all
    
    var title: String {
        switch self {
        case .lotte:
            return "롯데시네마"
        case .megabox:
            return "메가박스"
        case .cgv:
            return "CGV"
        case .all:
            return "전체보기"
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    @IBOutlet var theaterButton: UIButton!
    var lastAnnotationList: [MKPointAnnotation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        let coordinate = CLLocationCoordinate2D(latitude: 37.554921, longitude: 126.970345)
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(region, animated: true)
        
        let list = TheaterList.shared.getAll()
        self.setAnnoation(list)
    }

    func configureUI() {
        theaterButton.setTitle("브랜드 별 영화관 찾기", for: .normal)
        theaterButton.backgroundColor = .white
        theaterButton.setTitleColor(.black, for: .normal)
        theaterButton.layer.cornerRadius = 10
        
        theaterButton.addTarget(self, action: #selector(theaterButtonClicked(_:)), for: .touchUpInside)
    }
    
    func setAnnoation(_ data: [Theater]) {
        self.mapView.removeAnnotations(self.lastAnnotationList)
        
        for theater in data {
            let coordinate = CLLocationCoordinate2D(latitude: theater.latitude, longitude: theater.longitude)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = theater.location
            
            lastAnnotationList.append(annotation)
            mapView.addAnnotation(annotation)
        }
    }
    
    @objc func theaterButtonClicked(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let theaterCase = TheaterCase.allCases
        
        for dataCase in theaterCase {
            let action = UIAlertAction(title: dataCase.title, style: .default, handler: {_ in
                let list = TheaterList.shared.getList(dataCase.title)
                self.setAnnoation(list)
            })
            alert.addAction(action)
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
}

