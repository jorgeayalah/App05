//
//  AddToWatchList.swift
//  App05_TMDB
//
//  Created by A00828633 on 18/10/21.
//

import SwiftUI

struct AddToWatchList: View {
    @Environment(\.managedObjectContext) private var viewContext
    var fetchRequest: FetchRequest<WatchListModel>
    var list: FetchedResults<WatchListModel>{
        fetchRequest.wrappedValue
    }
    var media: Media
    
    var body: some View {
        VStack{
            Button{
                if list.count > 0 {
                    deleteMediaFromWatchList()
                }else{
                    addMediaToWatchList()
                }
            } label:{
                Image(systemName: list.count > 0 ? "star.fill" : "star")
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
        if let index = list.firstIndex(where: {$0.id == media.id}) {
            viewContext.delete(list[index])
            try? viewContext.save()
        }
    }
    
    init(filter: Media){
        media = filter
        fetchRequest = FetchRequest<WatchListModel>(entity: WatchListModel.entity(), sortDescriptors: [],
                                                    predicate: NSPredicate(format: "id == %@", NSNumber(value: filter.id)))
    }
}

struct AddToWatchList_Previews: PreviewProvider {
    static var previews: some View {
        AddToWatchList(filter: Media.dummy)
    }
}
