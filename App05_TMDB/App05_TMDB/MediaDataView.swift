//
//  MediaDataView.swift
//  App05_TMDB
//
//  Created by A00828633 on 27/09/21.
//

import SwiftUI
import Kingfisher

struct MediaDataView: View {
    @StateObject var mediaModel : MediaModel
    var media : Media
    @State var posters = [String]()
    @State var trailers = [Trailer]()
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    Text(media.title)
                        .font(.title)
                    Text(media.overview)
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
                mediaModel.loadMoviePosters(id: media.id, handler:{(returnedImages) in
                    self.posters.removeAll()
                    self.posters.append(contentsOf: returnedImages)
                })
                mediaModel.loadMovieTrailers(id: media.id, handler:{(returnedTrailers) in
                    self.trailers.removeAll()
                    self.trailers.append(contentsOf: returnedTrailers)
                })
            }
        }
    }
}

struct MediaDataView_Previews: PreviewProvider {
    static var previews: some View {
        MediaDataView(mediaModel: MediaModel(), media: Media.dummy)
    }
}
