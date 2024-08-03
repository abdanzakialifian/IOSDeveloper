//
//  DetailViewController.swift
//  DicodingApps
//
//  Created by Abdan Zaki Alifian on 03/05/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var academyImage: UIImageView!
    @IBOutlet weak var academyTitle: UILabel!
    @IBOutlet weak var academyDescription: UILabel!
    
    var academy: AcademyModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let result = academy {
            academyImage.image = result.image
            academyTitle.text = result.name
            academyDescription.text = result.description
        }
    }
    
    @IBAction func goToWebsite(_ sender: Any) {
        let urlDicoding = "https://www.dicoding.com"
        if let url = URL(string: urlDicoding), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
}
