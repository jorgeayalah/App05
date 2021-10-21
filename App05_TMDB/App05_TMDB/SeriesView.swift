//
//  SeriesView.swift
//  App05_TMDB
//
//  Created by Alumno on 27/09/21.
//

import SwiftUI

struct SeriesView: View {
    @ObservedObject var mediaModel : MediaModel
    
    var body: some View {
        //Text("Movies")
        GeometryReader{ geo in
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(mediaModel.seriesNowPlaying){
                        serie in
                        NavigationLink(destination: MediaDataView(mediaModel: mediaModel, media: serie)){
                            MediaRowView(media: serie, width: geo.size.width)
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

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(mediaModel: MediaModel())
    }
}
