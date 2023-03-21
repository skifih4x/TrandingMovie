//
//  MainViewController.swift
//  TrandingMovie
//
//  Created by Артем Орлов on 21.03.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MainViewModel = MainViewModel()
    
    var cellDataSource: [Movie]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        bondViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    func configView() {
        title = "MainView"
        view.backgroundColor = .red
        
        setupTableView()
    }
    
    func bondViewModel() {
        viewModel.isLoading.bing { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSources.bing { [weak self]  movies in
            guard let self = self, let movies = movies else {
                return
            }
            self.cellDataSource = movies
            self.reloadTableView()
        }
    }
}