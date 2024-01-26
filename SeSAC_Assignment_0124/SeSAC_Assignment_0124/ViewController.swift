//
//  ViewController.swift
//  SeSAC_Assignment_0124
//
//  Created by 이중엽 on 1/24/24.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet var myMapView: MKMapView!
    @IBOutlet var locationButton: UIButton!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.delegate = self
    }
    
    @IBAction func locationButtonClicked(_ sender: UIButton) {
        // locationManagerDidChangeAuthorization 실행
        checkDeviceLocationAuthorization()
    }
    
    // 디바이스의 위치 서비스 활성화 체크 후 어플리케이션의 현재 위치 권한 별 설정 요청
    func checkDeviceLocationAuthorization() {
        
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                
                let appAuthorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *) {
                    // iOS 14 이후에는 저장 프로퍼티로 존재
                    appAuthorization = self.locationManager.authorizationStatus
                } else {
                    // iOS 14 이전에는 타입 메소드로 존재
                    appAuthorization = CLLocationManager.authorizationStatus()
                }
                
                // 위치 서비스가 켜져 있다면, 앱 위치 권한 상태에 따라 분기 처리
                self.checkAppLocationAuthorization(status: appAuthorization)
                
            } else {
                print("'설정 > 개인정보 보호 및 보안 > 위치 서비스'를 켜주시기 바랍니다.")
            }
        }
    }
    
    // 어플리케이션의 현재 위치 권한 별 설정
    func checkAppLocationAuthorization(status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined: // 아직 권한 설정을 하지 않은 상태
            
            // 권한 요청 전 desiredAccuracy 설정
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            
            // 아직 권한 설정을 하지 않았기 때문에 권한 요청
            locationManager.requestWhenInUseAuthorization()
        case .denied: // 권한 설정을 거절한 상태
            
            DispatchQueue.main.async {
                // 학원으로 위치 설정
                let myLocationCoordinate = CLLocationCoordinate2D(latitude: 37.654696, longitude: 127.049758)
                self.setRegionAndAnnotation(center: myLocationCoordinate)
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = myLocationCoordinate
                annotation.title = "새싹~"
                
                self.myMapView.addAnnotation(annotation)
                
                // 아이폰 '설정'으로 이동 alert
                // UI 관련 항목이기 때문에 main 스레드로 변경
                
                self.showLocationSettingAlert()
            }
            
        case .authorizedWhenInUse: // 권한 설정을 어플을 사용하는 동안 허용한 상태
            
            // 위치값 한번만 업데이트
            locationManager.requestLocation()
            
            // 위치값 업데이트 - 계속 업데이트 할게 아니라면 특정 부분에서 stop해줘야 함
            // locationManager.startUpdatingLocation()
            
        default: return
        }
    }
    
    func showLocationSettingAlert() {
        let alert = UIAlertController(title: "위치 정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "확인", style: .default) { _ in
            // 아이폰 '설정'으로 이동
            guard let setting = URL(string: UIApplication.openSettingsURLString) else { return }
            
            UIApplication.shared.open(setting)
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(action)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 100, longitudinalMeters: 100)
        
        myMapView.setRegion(region, animated: true)
    }
}

extension ViewController: CLLocationManagerDelegate {
    // 사용자의 위치를 업데이트 한 경우 실행
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let coordinate = locations.last?.coordinate {
            setRegionAndAnnotation(center: coordinate)
        }
    }
    
    // 사용자의 위치를 업데이트 실패한 경우 실행
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        self.checkDeviceLocationAuthorization()
    }
}
