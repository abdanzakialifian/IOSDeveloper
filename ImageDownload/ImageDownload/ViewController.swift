//
//  ViewController.swift
//  ImageDownload
//
//  Created by Abdan Zaki Alifian on 24/05/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UIScrollViewDelegate {
    @IBOutlet weak var movieTableView: UITableView!
    
    private let pendingOperations = PendingOperations()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTableView.dataSource = self
        movieTableView.register(
            UINib(nibName: "MovieTableViewCell", bundle: nil), 
            forCellReuseIdentifier: "movieTableViewCell"
        )
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "movieTableViewCell", for: indexPath) as? MovieTableViewCell {
            let movie = movies[indexPath.row]
            cell.movieTitle.text = movie.title
            cell.movieImage.image = movie.image
            
            if movie.state == .new {
                cell.indicatorLoading.isHidden = false
                cell.indicatorLoading.startAnimating()
                startOperations(movie: movie, indexPath: indexPath)
            } else {
                cell.indicatorLoading.isHidden = true
                cell.indicatorLoading.stopAnimating()
            }
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    fileprivate func startOperations(movie: MovieModel, indexPath: IndexPath) {
        if movie.state == .new {
            startDownload(movie: movie, indexPath: indexPath)
        }
    }
    
    fileprivate func startDownload(movie: MovieModel, indexPath: IndexPath) {
        guard pendingOperations.downloadInProgress[indexPath] == nil else { return }
        let downloader = ImageDownloader(movie: movie)
        
        downloader.completionBlock = {
            if downloader.isCancelled { return }
            
            DispatchQueue.main.async {
                self.pendingOperations.downloadInProgress.removeValue(forKey: indexPath)
                self.movieTableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        
        pendingOperations.downloadInProgress[indexPath] = downloader
        pendingOperations.downloadQueue.addOperation(downloader)
    }
    
    fileprivate func toggleSuspendOperations(isSuspend: Bool) {
        pendingOperations.downloadQueue.isSuspended = isSuspend
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        toggleSuspendOperations(isSuspend: true)
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        toggleSuspendOperations(isSuspend: false)
    }
}

