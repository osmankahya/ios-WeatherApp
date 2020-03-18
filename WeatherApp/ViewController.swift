//
//  ViewController.swift
//  WeatherApp
//
//  Created by Osman Kahya on 15.03.2020.
//  Copyright © 2020 Osman Kahya. All rights reserved.
//

import UIKit
import MapKit
 
class ViewController: UIViewController, CLLocationManagerDelegate  {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var precipitationLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var refleshButton: UIButton!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var locationManager = CLLocationManager()
    let client = DarkSkyAPIClient()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
            locationManager.startUpdatingLocation()
        }
        
 /*
        let session = URLSession(configuration: URLSessionConfiguration.default)
        print("row-1")
        let task = session.dataTask(with: request){ data, response, error in
            print("row-2")
            let jsonData = try! JSONSerialization.jsonObject(with: data!, options: [])
            Thread.sleep(forTimeInterval: 5)
            print(jsonData)
            print("row-3")
        }
        //yazılan task çalışır
        task.resume()
        print("row-4")
        print("running code")
        
       
        let weatherData = try! Data(contentsOf: requestURL!)
        print(weatherData)
        
        let jsonData = try! JSONSerialization.jsonObject(with: weatherData, options: [])
        Thread.sleep(forTimeInterval: 7)
        print(jsonData)
        
        
        let weather = CurrentWeather(temperature: 72.2, precipProbability: 0.4, summary: "COLD", humidity: 0.3, icon: "wind")
        let viewModel = CurrentWeatherModel(data: weather)
        showWeather(model: viewModel)
 */
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locationValue: CLLocationCoordinate2D = manager.location!.coordinate
        let clientCoordinate = Coordinate(latitude: locationValue.latitude, longitude: locationValue.longitude)
        print("Latitude: \(clientCoordinate.latitude), Longitude: \(clientCoordinate.longitude)")
        updateWeather(coordinate: clientCoordinate)
    }
    
    func updateWeather(coordinate: Coordinate) {
        client.getCurrentWeather(at: Coordinate.alcatrazIsland) { currentWeather, error in
            //print(error)
            //print(currentWeather)
            if let currentWeather = currentWeather{
               let viewModel = CurrentWeatherModel(data: currentWeather)
               DispatchQueue.main.async {
                   self.showWeather(model: viewModel)
               }
            }
        }
    }
    
    func showWeather(model: CurrentWeatherModel){
        summaryLabel.text = model.summary
        humidityLabel.text = model.humidity
        temperatureLabel.text = model.temperature
        precipitationLabel.text = model.precipitationProbability
        weatherIcon.image = model.icon
    }

}
