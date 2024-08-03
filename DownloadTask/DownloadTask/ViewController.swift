//
//  ViewController.swift
//  DownloadTask
//
//  Created by Abdan Zaki Alifian on 26/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var messageView: UILabel!
    
    @IBOutlet weak var buttonView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        messageView.text = ""
        progressView.isHidden = true
        
        DownloadManager.shared.progress = { (totalBytesWritten, totalBytesExpectedToWrite) in
            let totalMb = ByteCountFormatter.string(
                fromByteCount: totalBytesExpectedToWrite, 
                countStyle: .binary
            )
            let writtenMb = ByteCountFormatter.string(
                fromByteCount: totalBytesWritten,
                countStyle: .binary
            )
            let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
            
            DispatchQueue.main.async {
                self.buttonView.isEnabled = false
                self.progressView.isHidden = false
                self.progressView.progress = progress
                self.messageView.text = "Downloading \(writtenMb) of \(totalMb)"
            }
        }
        
        DownloadManager.shared.completed = { (location) in
            try? FileManager.default.removeItem(at: location)
            DispatchQueue.main.async {
                self.messageView.text = "Download finished"
                self.buttonView.isEnabled = true
            }
        }
        
        DownloadManager.shared.downloadError = { (task, error) in
            debugPrint("Task Completed: \(task), error: \(String(describing: error?.localizedDescription))")
        }
    }

    @IBAction func buttonDownload(_ sender: Any) {
        let url = URL(string: "http://212.183.159.230/50MB.zip")
        let task = DownloadManager.shared.session.downloadTask(with: url!)
        task.resume()
    }
}

