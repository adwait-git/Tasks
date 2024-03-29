//
//  ViewController.swift
//  TaskSix
//
//  Created by AllSpark on 02/12/19.
//  Copyright © 2019 AllSpark. All rights reserved.
//

import UIKit

//MARK: Struct to parse XML File
struct Book {
    var bookTitle: String
    var bookAuthor: String
}
class HomeViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,XMLParserDelegate{

    //MARK: Object & IBOutlet Life Cycle
    
    @IBOutlet var xmlParseTableView: UITableView!
    var books: [Book] = []
    var elementName: String = String()
    var bookTitle = String()
    var bookAuthor = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchForFile()
        xmlParseTableView.reloadData()
        setupNavBarForLeftMenuIcon(title: "XML Parsing")
        // Do any additional setup after loading the view.
    }
    //MARK Search For XML Parsing File
    func searchForFile() {
        if let path = Bundle.main.url(forResource: "Books", withExtension: "xml") {
            if let parser = XMLParser(contentsOf: path) {
                parser.delegate = self
                parser.parse()
            }
        }
    }
    
    //MARK XMLParsing Delegate
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "book" {
            bookTitle = String()
            bookAuthor = String()
        }
        self.elementName = elementName
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "book" {
            let book = Book(bookTitle: bookTitle, bookAuthor: bookAuthor)
            books.append(book)
        }
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if (!data.isEmpty) {
            if self.elementName == "title" {
                bookTitle += data
            } else if self.elementName == "author" {
                bookAuthor += data
            }
        }
    }
   func numberOfSections(in tableView: UITableView) -> Int {
        // return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return books.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let book = books[indexPath.row]
        
        cell.textLabel?.text = book.bookTitle
        cell.detailTextLabel?.text = book.bookAuthor
        
        return cell
    }

}

