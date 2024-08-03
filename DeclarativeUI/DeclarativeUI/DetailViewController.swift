//
//  DetailViewController.swift
//  DeclarativeUI
//
//  Created by Abdan Zaki Alifian on 04/05/24.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .green
        
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backAction))
        
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backAction() {
        dismiss(animated: true, completion: nil)
    }
}
