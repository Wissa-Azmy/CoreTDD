//
//  ViewController.swift
//  CoreTDD
//
//  Created by Wissa Azmy on 11/22/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {
    
    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet weak var dataSource: MoviesLibraryDataService!
    
    let movieManager = MovieManager()
    
    let fairyTail = Movie(title: "Fairy Tail")
    let thriller = Movie(title: "Thriller", releaseDate: "2015")
    let darkComedy = Movie(title: "Dark Comedy")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        libraryTableView.dataSource = dataSource
        libraryTableView.delegate = dataSource
        
        dataSource.movieManager = movieManager
        movieManager.add(movie: fairyTail)
        movieManager.add(movie: darkComedy)
        movieManager.add(movie: thriller)
    }

}

