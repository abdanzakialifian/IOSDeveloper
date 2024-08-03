//
//  PendingOperations.swift
//  ImageDownload
//
//  Created by Abdan Zaki Alifian on 24/05/24.
//

import Foundation

class PendingOperations {
    lazy var downloadInProgress: [IndexPath: Operation] = [:]
    
    lazy var downloadQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.name = "com.github"
        queue.maxConcurrentOperationCount = 2
        return queue
    }()
}
