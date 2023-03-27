//
//  MainViewModel.swift
//  TrandingMovie
//
//  Created by Артем Орлов on 21.03.2023.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSources: Observable<[MovieTableCellViewModel]> = Observable(nil)
    var dataSource: TrendingMovieModel?
    
    func numberOfSection() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        dataSource?.results.count ?? 20
    }
    
    func getData() {
        
        if isLoading.value ?? true {
            return
        }
        
        isLoading.value = true
        
        ApiCaller.getTrandingMovie { [weak self] result in
            self?.isLoading.value = false
            
            switch result {
            case .success(let success):
                print("top trending coubts: \(success.results.count)")
                self?.dataSource = success
                self?.mapCellData()
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func mapCellData() {
        cellDataSources.value = dataSource?.results.compactMap({MovieTableCellViewModel(movie: $0)})
    }

    func getMovieTitle(_ movie: Movie) -> String {
        movie.title ?? movie.name ?? ""
    }
}
