//
//  ViewController.swift
//  DicodingApps
//
//  Created by Abdan Zaki Alifian on 28/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var academyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        academyTableView.dataSource = self
        academyTableView.delegate = self
        
        academyTableView.register(
            UINib(nibName: "AcademyTableViewCell", bundle: nil),
            forCellReuseIdentifier: "AcademyCell"
        )
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dummyAcademyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: "AcademyCell", 
            for: indexPath
        ) as? AcademyTableViewCell {
            let academy = dummyAcademyData[indexPath.row]
            cell.academyImageView.image = academy.image
            cell.academyTitle.text = academy.name
            cell.academyDescription.text = academy.description
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "moveToDetail", sender: dummyAcademyData[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToDetail" {
            if let detailViewController = segue.destination as? DetailViewController {
                detailViewController.academy = sender as? AcademyModel
            }
        }
    }
}

