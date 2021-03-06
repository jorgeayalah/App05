//
//  MediaModel.swift
//  App05_TMDB
//
//  Created by Alumno on 27/09/21.
//

import SwiftUI
import SwiftyJSON
import Alamofire

class MediaModel : ObservableObject{
    @Published var genres = [Genre]() //empty array Genre type
    @Published var moviesNowPlaying = [Media]()
    @Published var seriesNowPlaying = [Media]()
    
    
    init(){ //constructor
        loadGenres()
    }
    
    func loadGenres(){ //extract movie data from APIs on Dependencies
        genres.removeAll()
        let URL = "\(tmdbURL)genre/movie/list?api_key=\(apikey)&language=en-US"
        
        //connection to Alamofire
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { [self] data in
            
            let json = try! JSON(data: data.data!) //creates an optional variable in case it doesnt contain data
            //print(json)
            
            var genre : Genre
            for j in json["genres"]{
                genre = Genre(id: j.1["id"].intValue, name: j.1["name"].stringValue)
                //print(genre.name)
                self.genres.append(genre)
            }
        }
        self.loadMoviesNowPlaying()
        self.loadSeriesNowPlaying()
    }
    
    func loadMoviesNowPlaying(){ //extracts movies now playing data data from APIs on Dependencies
        genres.removeAll()
        let URL = "\(tmdbURL)movie/now_playing?api_key=\(apikey)&language=en-US&page=1"
        
        //connection to Alamofire
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { [self] data in
            
            let json = try! JSON(data: data.data!) //creates an optional variable in case it doesnt contain data
            //print(json)
            
            var movie : Media
            for m in json["results"]{
                var genresIDs = [String]()
                for g in m.1["genre_id"]{
                    if let idx = genres.firstIndex(where: {$0.id == g.1.intValue}){
                        genresIDs.append(self.genres[idx].name)
                    }
                    
                }
                movie = Media(id: m.1["id"].intValue,
                              title: m.1["title"].stringValue,
                              overview: m.1["overview"].stringValue,
                              poster: m.1["poster_path"].stringValue,
                              voteAvg: m.1["vote_average"].doubleValue,
                              genres: genresIDs,
                              releaseDate: m.1["release_date"].stringValue,
                              isMovie: true)
                self.moviesNowPlaying.append(movie)
            }
        }
    }
    
    func loadSeriesNowPlaying(){ //extracts series now playing data from APIs on Dependencies
        let URL = "\(tmdbURL)tv/on_the_air?api_key=\(apikey)&language=en-US&page=1"
        
        //connection to Alamofire
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { [self] data in
            
            let json = try! JSON(data: data.data!) //creates an optional variable in case it doesnt contain data
            //print(json)
            
            var serie: Media
            
            for m in json["results"]{
                var genresIDs = [String]()
                for g in m.1["genre_id"]{
                    if let idx = genres.firstIndex(where: {$0.id == g.1.intValue}){
                        genresIDs.append(self.genres[idx].name)
                    }
                    
                }
                serie = Media(id: m.1["id"].intValue,
                              title: m.1["title"].stringValue,
                              overview: m.1["overview"].stringValue,
                              poster: m.1["poster_path"].stringValue,
                              voteAvg: m.1["vote_average"].doubleValue,
                              genres: genresIDs,
                              releaseDate: m.1["release_date"].stringValue,
                              isMovie: false)
                self.moviesNowPlaying.append(serie)
            }
        }
    }
    
    func loadPosters(id: Int, isMovie: Bool, handler: @escaping(_ returnedImages: [String]) -> ()){ //extracts series now playing data from APIs on Dependencies
        var URL: String
        if(isMovie){
            URL = "\(tmdbURL)movie/\(id)/images?api_key=\(apikey)"
        }else{
            URL = "\(tmdbURL)tv/\(id)/images?api_key=\(apikey)"
        }
        //let URL = "\(tmdbURL)movie/\(id)/images?api_key=\(apikey)" //change this
        //connection to Alamofire
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { [self] data in
            
            let json = try! JSON(data: data.data!) //creates an optional variable in case it doesnt contain data
            
            var images = [String]()
            for image in json["posters"]{
                if image.1["width"].intValue == 2000 && image.1["iso_639_1"].stringValue == "en"{
                    images.append(image.1["file_path"].stringValue)
                }
            }
            handler(images)
        }
    }
    
    func loadTrailers(id: Int, isMovie: Bool, handler: @escaping(_ returnedTrailers: [Trailer]) -> ()){ //extracts trailers from movies now playing data from APIs on Dependencies
        var URL: String
        if(isMovie){
            URL = "\(tmdbURL)movie/\(id)/videos?api_key=\(apikey)&language=en-US" //change this
        }else{
            URL = "\(tmdbURL)tv/\(id)/videos?api_key=\(apikey)&language=en-US"
        }
        //connection to Alamofire
        AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { [self] data in
            
            let json = try! JSON(data: data.data!) //creates an optional variable in case it doesnt contain data
            
            var trailers = [Trailer]()
            var trailer : Trailer
            for t in json["results"]{
                trailer = Trailer(id: t.1["id"].stringValue,
                                  name: t.1["name"].stringValue,
                                  key: t.1["key"].stringValue,
                                  type: t.1["type"].stringValue)
                trailers.append(trailer)
            }
            trailers.sort {$0.type > $1.type}
            handler(trailers)
        }
    }
    
}

