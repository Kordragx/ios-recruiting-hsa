//
//  MoviesService.swift
//  Movies
//
//  Created by Daniel Nunez on 04-03-21.
//

import Alamofire
import Foundation

public class MoviesService: MovieInterface {
    func fetchMovies(_ page: Int, _ completion: @escaping ([Movie]) -> Void, errorCompletion: @escaping () -> Void) {
        let path = API.moviesPath(with: page)
        AF.request(path).responseJSON { response in

            switch response.result {
            case .success:

                guard response.data != nil else {
                    errorCompletion()
                    return
                }

                let decoder = JSONDecoder()

                if let movies = try? decoder.decode(
                    MoviesResponse.self,
                    from: response.data!
                ) {
                    completion(movies.toDomain())
                }
            case .failure:
                errorCompletion()
            }
        }
    }
}
