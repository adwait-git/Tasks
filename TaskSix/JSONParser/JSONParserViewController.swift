//
//  JSONParserViewController.swift
//  TaskSix
//
//  Created by AllSpark on 02/12/19.
//  Copyright © 2019 AllSpark. All rights reserved.
//

import UIKit

class JSONParserViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var jsonParsingTableView: UITableView!
    var resultArray = [Result]()
    var titleResult = NSMutableArray()
     var ingrediantsArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getQuotesFromJSON()
        setupNavBarForLeftMenuIcon(title: "JSON Parsing")
        // Do any additional setup after loading the view.
    }
    func getQuotesFromJSON() {
        let urlPath = "http://www.recipepuppy.com/api/?i=onions,garlic&q=omelet&p=3"
        let url = NSURL(string: urlPath)
        let session = URLSession.shared
        let task = session.dataTask(with: url! as URL) { data, response, error in
            print("Task completed")
            
            guard data != nil && error == nil else {
                print(error?.localizedDescription as Any)
                return
            }
            do {
                let response = try JSONDecoder().decode(Food.self, from: data!)
                self.resultArray = response.results
                DispatchQueue.main.async {
                   self.jsonParsingTableView.reloadData()
                }
            } catch let parseError as NSError {
                print("JSON Error \(parseError.localizedDescription)")
            }
        }
        task.resume()
    }

    
    //MARK: TableView Delegate and DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let jsonParsingCell = tableView.dequeueReusableCell(withIdentifier: "JsonParsingTableViewCell", for: indexPath) as! JsonParsingTableViewCell
        for result in resultArray {
            titleResult.add(result.title)
        }
        for ingre in resultArray {
          ingrediantsArray.add(ingre.ingredients)
        }
        jsonParsingCell.ingredientsLabel.text = ingrediantsArray[indexPath.row] as?  String
        jsonParsingCell.titleLabel.text = titleResult[indexPath.row] as? String
        
        return jsonParsingCell
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
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
