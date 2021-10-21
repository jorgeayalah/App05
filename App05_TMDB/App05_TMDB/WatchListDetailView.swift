//
//  WatchListDetailView.swift
//  App05_TMDB
//
//  Created by Alumno on 21/10/21.
//

import SwiftUI
import Kingfisher

struct WatchListDetailView: View {
    @ObservedObject var mediaModel : MediaModel //TMDBView is sending it
    var media : WatchListModel
    @State var posters = [String]()
    @State var trailers = [Trailer]()
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    Text(media.title_wrapped)
                        .font(.title)
                    Text(media.overview_wrapped)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(media.genres, id: \.self) { g in
                                Text(g)
                                    .padding()
                            }
                        }
                    }
                    NavigationLink(
                        destination: TrailersView(trailers: $trailers),
                        label: {
                            Label("Trailer", systemImage: "play.tv")
                        })
                    if posters.count > 0 {
                        TabView{
                            ForEach(posters, id: \.self){ poster in
                                KFImage(URL(string: "\(imageURL)\(poster)"))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                        .frame(width: geo.size.width-40, height: (geo.size.width-40)/0.666667)
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    }
                }.padding(.horizontal, 20)
            }
            .onAppear{ //when the view opens for the first time
                mediaModel.loadPosters(id: Int(media.id), isMovie: media.isMovie, handler:{(returnedImages) in
                    self.posters.removeAll()
                    self.posters.append(contentsOf: returnedImages)
                })
                mediaModel.loadTrailers(id: Int(media.id), isMovie: media.isMovie,handler:{(returnedTrailers) in
                    self.trailers.removeAll()
                    self.trailers.append(contentsOf: returnedTrailers)
                })
            }
        }
    }
}

struct WatchListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListDetailView(mediaModel: MediaModel(), media: WatchListModel())
    }
}
