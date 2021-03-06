//
//  MovieDetailPresenter.swift
//  Movies
//
//  Created by Daniel Nunez on 04-03-21.
//

import Foundation

class MovieDetailPresenter {
    weak var movieDetailController: MovieDetailProtocol!
    let movie: Movie
    let favoriteMng: CacheManager!

    init(movie: Movie, movieDetail: MovieDetailProtocol) {
        self.movie = movie
        movieDetailController = movieDetail
        favoriteMng = CacheManager()
    }

    func load() {
        movieDetailController.fill(movie)
    }

    func saveFavorite() {
        movie.isFavorite = true
        movieDetailController.saved()
        favoriteMng.save(movie: movie)
    }

    func deleteFavorite() {
        movie.isFavorite = true
        movieDetailController.saved()
        favoriteMng.save(movie: movie)
    }
}
