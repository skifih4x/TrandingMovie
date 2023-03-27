//
//  MainMovieCell.swift
//  TrandingMovie
//
//  Created by Артем Орлов on 21.03.2023.
//

import UIKit
import SDWebImage

class MainMovieCell: UITableViewCell {
    
    public static var identifier: String {
        get {
            "MainMovieCell"
        }
    }
    
    public static func register() -> UINib {
        UINib(nibName: "MainMovieCell", bundle: nil)
    }

    // MARK: - OBOutlets
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.addBorder(color: .label, width: 1)
        backView.round()
        backView.backgroundColor = .lightGray
        
        movieImageView.round(5)

    }
    
    func setupCell(viewModel: MovieTableCellViewModel) {
        nameLabel.text = viewModel.title
        dateLabel.text = viewModel.date
        rateLabel.text = viewModel.rating
        movieImageView.sd_setImage(with: viewModel.imageUrl)
    }
}
