//
//  BaseViewController.swift
//  TaskSix
//
//  Created by AllSpark on 02/12/19.
//  Copyright © 2019 AllSpark. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: SetUp SideMenu For View Controllers
    func setupNavBarForLeftMenuIcon(title: String) {
        let customView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 44.0))
        let menuButton = UIButton.init(type: .custom)
        menuButton.setBackgroundImage(UIImage(named: "SideMenu"), for: .normal)
        menuButton.frame = CGRect(x: 0.0, y: 5.0, width: 24, height: 24)
        menuButton.addTarget(self, action: #selector(menuAction), for: .touchUpInside)
        customView.addSubview(menuButton)
        let marginX = CGFloat(menuButton.frame.origin.x + menuButton.frame.size.width + 16)
        let navigationTitle = UILabel(frame: CGRect(x: marginX, y: -5.0, width: 250.0, height: 44.0))
        navigationTitle.text = title
        navigationTitle.textAlignment = NSTextAlignment.left
        navigationTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        customView.addSubview(navigationTitle)
        let leftButton = UIBarButtonItem(customView: customView)
        self.navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc func menuAction() {
        let appDel = UIApplication.shared.delegate as! AppDelegate
        appDel.drawerStatus(isOpen: true,animated: true)
        //   appDel.drawerController?.drawerDirection = .right
    }
    func setUpBackButtonInNav() {
        let customView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 44.0))
        let menuButton = UIButton.init(type: .custom)
        menuButton.setTitle("Back", for: .normal)
        menuButton.setTitleColor(.red, for: .normal)
        //menuButton.tintColor = UIColor.blue
        //  menuButton.titleColor(for: .normal
        //    menuButton.setBackgroundImage(UIImage(named: "SideMenu"), for: .normal)
        menuButton.frame = CGRect(x: 0.0, y: 5.0, width: 40, height: 24)
        menuButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        customView.addSubview(menuButton)
        let leftButton = UIBarButtonItem(customView: customView)
        self.navigationItem.leftBarButtonItem = leftButton
    }
    @objc func backAction(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func invokeAlertMethod(strTitle: NSString, strBody: NSString, delegate: AnyObject?) {
        let alert: UIAlertView = UIAlertView()
        alert.message = strBody as String
        alert.title = strTitle as String
        alert.delegate = delegate
        alert.addButton(withTitle: "Ok")
        alert.show()
    }
}
