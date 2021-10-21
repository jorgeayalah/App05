//
//  WatchListView.swift
//  App05_TMDB
//
//  Created by Alumno on 18/10/21.
//

import SwiftUI

struct WatchListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \WatchListModel.releaseDate, ascending: true)],
        animation: .default)
    private var lists: FetchedResults<WatchListModel>
    @ObservedObject var mediaModel = MediaModel()
    @State var offsetY: CGFloat = 0
    //let detectDirectionalDrags =
    
    var body: some View{
        GeometryReader{ geo in
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(lists){
                        media in
                        NavigationLink(destination: WatchListDetailView(mediaModel: MediaModel(), media: media)){
                            WatchListRowView(media: media, width: geo.size.width)
//                                .gesture(
//                                    DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
//                                    .onEnded { value in
//                                        print(value.translation)
//
//                                        if value.translation.width < 0 && value.translation.height > -30 && value.translation.height < 30 {
//                                            print("left swipe")
//                                        }
//                                        else if value.translation.width > 0 && value.translation.height > -30 && value.translation.height < 30 {
//                                            print("right swipe")
//                                        }
//                                        else if value.translation.height < 0 && value.translation.width < 100 && value.translation.width > -100 {
//                                            print("up swipe")
//                                            offsetY = value.translation.height
//                                        }
//                                        else if value.translation.height > 0 && value.translation.width < 100 && value.translation.width > -100 {
//                                            print("down swipe")
//                                        }
//                                        else {
//                                            print("no clue")
//                                        }
//
//                                )
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

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListView()
    }
}
