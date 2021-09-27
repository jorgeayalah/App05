//
//  MoviesView.swift
//  App05_TMDB
//
//  Created by Alumno on 27/09/21.
//

import SwiftUI
import Kingfisher

struct MoviesView: View {
    @StateObject var mediaModel : MediaModel
    
    var body: some View {
        //Text("Movies")
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(mediaModel.moviesNowPlaying){
                    movie in
                    NavigationLink(destination: MediaDataView(media: movie)){
                        MediaRowView(media: movie)
                    }
                    //to be changed
                    //Text(movie.title)
                }
            }
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(mediaModel: MediaModel())
    }
}
