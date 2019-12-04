//
//  WeatherDetailViewController.swift
//  TaskSix
//
//  Created by AllSpark on 03/12/19.
//  Copyright © 2019 AllSpark. All rights reserved.
//

import UIKit
import CoreLocation
class WeatherDetailViewController: UIViewController {
    
    var selectedCity = String()
    var lat = Double()
    var long = Double()
    var resultArray = [Weather]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getCoordsOfSelecttedCity()
        //self.getTheCurrentWeather()
        print(selectedCity)
    }
    
    func getCoordinateFrom(address: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
        CLGeocoder().geocodeAddressString(address) { completion($0?.first?.location?.coordinate, $1) }
    }
    
    //MARK: Get current city co-ords
    func getCoordsOfSelecttedCity() {
        getCoordinateFrom(address: selectedCity) { coordinate, error in
            guard let coordinate = coordinate, error == nil else { return }
            self.lat = coordinate.latitude
            self.long = coordinate.longitude
            self.getTheCurrentWeather()
            // don't forget to update the UI from the main thread
            DispatchQueue.main.async {
                print(coordinate.latitude,coordinate.longitude)
               
            }
        }
    }
    
    func getTheCurrentWeather() {
        
        let urlPath = "https://www.metaweather.com/api/location/search/?lattlong=" + "\(lat)" + "," + "\(long)"
        let url = NSURL(string: urlPath)
        let session = URLSession.shared
        let task = session.dataTask(with: url! as URL) { data, response, error in
            print("Task completed")
            
            guard data != nil && error == nil else {
                print(error?.localizedDescription as Any)
                return
            }
            do {
                let response = try JSONDecoder().decode(Weather.self, from: data!)
                self.resultArray = [response]
                for woe in self.resultArray {
                    print(woe)
                }
                DispatchQueue.main.async {
                   // self.jsonParsingTableView.reloadData()
                }
            } catch let parseError as NSError {
                print("JSON Error \(parseError.localizedDescription)")
            }
        }
        task.resume()
       
    }
    
    
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
