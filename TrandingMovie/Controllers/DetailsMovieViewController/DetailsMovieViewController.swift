//
//  DetailsMovieViewController.swift
//  TrandingMovie
//
//  Created by Артем Орлов on 27.03.2023.
//

import UIKit
import SDWebImage

class DetailsMovieViewController: UIViewController {

    // MARK: - IBOutleets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var viewModel: DetailsMovieViewModel
    
    init(viewModel: DetailsMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsMovieViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        
    }
    
    func configView() {
        title = "Movie Details"
        titleLabel.text = viewModel.movieTitle
        descriptionLabel.text = viewModel.movieDescrition
        imageView.sd_setImage(with: viewModel.movieImage)
    }
}
