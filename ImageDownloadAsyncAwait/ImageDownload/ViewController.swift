//
//  ViewController.swift
//  ImageDownload
//
//  Created by Abdan Zaki Alifian on 24/05/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UIScrollViewDelegate {
    @IBOutlet weak var movieTableView: UITableView!
    
    lazy var imageDownloader = ImageDownloader()
    
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
                startDownload(movie: movie, indexPath: indexPath)
            } else {
                cell.indicatorLoading.isHidden = true
                cell.indicatorLoading.stopAnimating()
            }
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    fileprivate func startDownload(movie: MovieModel, indexPath: IndexPath) {
        if movie.state == .new {
            Task {
                do {
                    let image = try await imageDownloader.downloadImage(url: movie.poster)
                    movie.state = .downloaded
                    movie.image = image
                    self.movieTableView.reloadRows(at: [indexPath], with: .automatic)
                } catch {
                    movie.state = .failed
                    movie.image = nil
                }
            }
        }
    }
}

