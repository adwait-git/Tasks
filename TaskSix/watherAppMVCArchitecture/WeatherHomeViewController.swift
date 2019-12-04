//
//  WeatherHomeViewController.swift
//  TaskSix
//
//  Created by AllSpark on 03/12/19.
//  Copyright © 2019 AllSpark. All rights reserved.
//

import UIKit

class WeatherHomeViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
  
    let timeZoneIdentifiers = TimeZone.knownTimeZoneIdentifiers
    var allCities: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
       self.getAllCitysName()
        // Do any additional setup after loading the view.
    }
    
    func getAllCitysName() {
        for identifier in timeZoneIdentifiers {
            if let cityName = identifier.split(separator: "/").last {
                allCities.append("\(cityName)")
            }
        }
        print(allCities)
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCities.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "WeatherCell"
        var cell : UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        cell.textLabel?.text = allCities[indexPath.row]
        return cell
    }
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentSelectedCity = allCities[indexPath.row]
        let weatherDetailVC = storyboard?.instantiateViewController(withIdentifier: "WeatherDetailViewController") as! WeatherDetailViewController
        weatherDetailVC.selectedCity = currentSelectedCity
        self.navigationController?.pushViewController(weatherDetailVC, animated: true)
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
