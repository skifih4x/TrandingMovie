//
//  DetailsMovieViewModel.swift
//  TrandingMovie
//
//  Created by Артем Орлов on 27.03.2023.
//

import UIKit

class DetailsMovieViewModel {
    
    var movie: Movie
    
    var movieImage: URL?
    var movieTitle: String
    var movieDescrition: String
    var movieID: Int
    
    init(movie: Movie) {
        self.movie = movie
        self.movieID = movie.id
        self.movieTitle = movie.title ?? movie.name ?? ""
        self.movieDescrition = movie.overview
        self.movieImage = makeImageUrl(movie.backdropPath)
        
    }
    
    private func makeImageUrl(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
