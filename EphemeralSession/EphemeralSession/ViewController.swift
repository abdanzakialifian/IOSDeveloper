//
//  ViewController.swift
//  EphemeralSession
//
//  Created by Abdan Zaki Alifian on 26/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadImage()
    }
    
    private func downloadImage() {
        let path = "https://images.glints.com/unsafe/glints-dashboard.s3.amazonaws.com/company-logo/0ecccc80caed7d3013433880e099e4fb.png"
        let url = URL(string: path)
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration)
        
        if let response = configuration.urlCache?.cachedResponse(
            for: URLRequest(url: url!)
        ) {
            label.text = "Use cache image"
            imageView.image = UIImage(data: response.data)
        } else {
            label.text = "Call image from network"
            let downloadTask = session.dataTask(with: url!) { [weak self] data, response, error in
                guard let self = self, let data = data else { return }
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
            downloadTask.resume()
        }
    }
}

