//
//  DownloadManager.swift
//  DownloadTask
//
//  Created by Abdan Zaki Alifian on 26/05/24.
//

import Foundation

class DownloadManager : NSObject, URLSessionDelegate, URLSessionDownloadDelegate {
    static var shared = DownloadManager()
    
    var progress: ((Int64, Int64) -> ())?
    var completed: ((URL) -> ())?
    var downloadError: ((URLSessionTask, Error?) -> ())?
    
    lazy var session: URLSession = {
        let config = URLSessionConfiguration.background(withIdentifier: "com.ios")
        config.isDiscretionary = false
        return URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue())
    }()
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        if totalBytesExpectedToWrite > 0 {
            progress?(totalBytesWritten, totalBytesExpectedToWrite)
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        completed?(location)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: (any Error)?) {
        downloadError?(task, error)
    }
}
