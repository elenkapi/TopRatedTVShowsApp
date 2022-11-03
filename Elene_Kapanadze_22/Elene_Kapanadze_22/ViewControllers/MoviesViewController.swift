//
//  ViewController.swift
//  Elene_Kapanadze_22
//
//  Created by Ellen_Kapii on 13.08.22.
//

import UIKit

class MoviesViewController: UIViewController {
    
    private lazy var background: UIImageView = {
        let background = UIImageView()
        background.image = UIImage(named: "background")
        background.contentMode = .scaleAspectFill
        view.addSubview(background)
        return background
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        view.addSubview(tableView)
        return tableView
    }()
    
    
    
    private var movies = [MovieData]()
    private var networkService = NetworkService.shared
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUp()
        setUpTableView()
        
        fetchData()
    }
    
    //MARK: - Configuration private functions
    
    private func setUp() {
        addBackground()
        addTableView()
    }
    
    private func setUpTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        
    }
    
    private func fetchData() {
        
        networkService.getData(urlString: "https://api.themoviedb.org/3/tv/top_rated?") {
            (result: Movie) in
            
            DispatchQueue.main.async {
                self.movies = result.results
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: - Add constraints to views
    
    private func addBackground() {
        
        background.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: background,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: view,
                                               attribute: .top,
                                               multiplier: 1,
                                               constant: 0)
        
        let leftConstraint = NSLayoutConstraint(item: background,
                                                attribute: .left,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: .left,
                                                multiplier: 1,
                                                constant: 0)
        
        let rightConstraint = NSLayoutConstraint(item: background,
                                                 attribute: .right,
                                                 relatedBy: .equal,
                                                 toItem: view,
                                                 attribute: .right,
                                                 multiplier: 1,
                                                 constant: 0)
        
        let bottomConstraint = NSLayoutConstraint(item: background,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: view,
                                                  attribute: .bottom,
                                                  multiplier: 1,
                                                  constant: 0)
        
        NSLayoutConstraint.activate([topConstraint, rightConstraint, leftConstraint, bottomConstraint])
        
    }
    
    private func addTableView() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = NSLayoutConstraint(item: tableView,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: view.safeAreaLayoutGuide,
                                               attribute: .top,
                                               multiplier: 1,
                                               constant: 40)
        
        let leftConstraint = NSLayoutConstraint(item: tableView,
                                                attribute: .left,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: .left,
                                                multiplier: 1,
                                                constant: 0)
        
        let rightConstraint = NSLayoutConstraint(item: tableView,
                                                 attribute: .right,
                                                 relatedBy: .equal,
                                                 toItem: view,
                                                 attribute: .right,
                                                 multiplier: 1,
                                                 constant: 0)
        
        let bottomConstraint = NSLayoutConstraint(item: tableView,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: view,
                                                  attribute: .bottom,
                                                  multiplier: 1,
                                                  constant: -30)
        
        NSLayoutConstraint.activate([topConstraint, rightConstraint, leftConstraint, bottomConstraint])
        
        
        
    }
    
    
    
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentMovie = movies[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        cell.backgroundColor = .clear
        cell.movieName.text = currentMovie.name
        cell.movieRating.text = "\(currentMovie.vote_average)"
        cell.moviePoster.load(url: URL(string: currentMovie.poster_path!)!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
}
