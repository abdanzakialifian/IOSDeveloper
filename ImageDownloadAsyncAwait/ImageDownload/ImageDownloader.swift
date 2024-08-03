//
//  ImageDownloader.swift
//  ImageDownload
//
//  Created by Abdan Zaki Alifian on 24/05/24.
//

import Foundation
import UIKit

class ImageDownloader {
    func downloadImage(url: URL) async throws -> UIImage? {
        async let imageData = try Data(contentsOf: url)
        return UIImage(data: try await imageData)
    }
}
