//
//  RemoveFromWatchListView.swift
//  App05_TMDB
//
//  Created by Alumno on 21/10/21.
//

import SwiftUI

struct RemoveFromWatchListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var media: WatchListModel
    
    var body: some View {
        VStack{
            Button{
                deleteMediaFromWatchList()
            } label:{
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(.yellow)
            }
        }
    }
    
    func addMediaToWatchList(){
        let m = WatchListModel(context: viewContext)
        m.id = Int32(media.id)
        m.title = media.title
        m.overview = media.overview
        m.releaseDate = media.releaseDate
        m.voteAvg = media.voteAvg
        m.poster = media.poster
        var arrGenre = [String]()
        for g in media.genres{
            arrGenre.append(g)
        }
        m.genres = arrGenre
        m.isMovie = media.isMovie
        try? viewContext.save()
    }
    
    func deleteMediaFromWatchList(){
        viewContext.delete(media)
        try? viewContext.save()
    }
    
}

struct RemoveFromWatchListView_Previews: PreviewProvider {
    static var previews: some View {
        RemoveFromWatchListView(media: WatchListModel())
    }
}
