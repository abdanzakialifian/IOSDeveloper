//
//  ImageDownloader.swift
//  ImageDownload
//
//  Created by Abdan Zaki Alifian on 24/05/24.
//

import Foundation
import UIKit

class ImageDownloader : Operation {
    private let movie: MovieModel
    
    init(movie: MovieModel) {
        self.movie = movie
    }
    
    override func main() {
        if isCancelled {
            return
        }
        
        guard let imageData = try? Data(contentsOf: self.movie.poster) else { return }
        
        if isCancelled {
            return
        }
        
        if imageData.isEmpty {
            self.movie.image = nil
            self.movie.state = .failed
        } else {
            self.movie.image = UIImage(data: imageData)
            self.movie.state = .downloaded
        }
    }
}
