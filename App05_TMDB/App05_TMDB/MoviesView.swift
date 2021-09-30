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
        GeometryReader{ geo in
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(mediaModel.moviesNowPlaying){
                        movie in
                        NavigationLink(destination: MediaDataView(mediaModel: MediaModel(), media: movie)){
                            MediaRowView(media: movie, width: geo.size.width)
                        }
                        //to be changed
                        //Text(movie.title)
                    }
                }
            }
        }
        .navigationBarTitle("Movies", displayMode: .inline)
        
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(mediaModel: MediaModel())
    }
}
