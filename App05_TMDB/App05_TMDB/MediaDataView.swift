//
//  MediaDataView.swift
//  App05_TMDB
//
//  Created by A00828633 on 27/09/21.
//

import SwiftUI
import Kingfisher

struct MediaDataView: View {
    var media : Media
    var body: some View {
        GeometryReader{ geo in
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    Text(media.title)
                    Text(media.overview)
                    HStack{
                        ForEach(media.genres, id: \.self) { g in
                            Text(g)
                                .padding()
                        }
                    }
                    KFImage(URL(string: "\(imageURL)\(media.poster)"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width-40)
                        .padding(.horizontal, 20)
                }
            }
        }
    }
}

struct MediaDataView_Previews: PreviewProvider {
    static var previews: some View {
        MediaDataView(media: Media.dummy)
    }
}
