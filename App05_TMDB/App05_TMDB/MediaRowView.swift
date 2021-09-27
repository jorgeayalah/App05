//
//  MediaRowView.swift
//  App05_TMDB
//
//  Created by Alumno on 27/09/21.
//

import SwiftUI
import Kingfisher

struct MediaRowView: View {
    var media : Media
    
    var body: some View {
        VStack{
            KFImage(URL(string: "\(imageURL)\(media.poster)"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180)
            Text(media.title)
        }
    }
}

struct MediaRowView_Previews: PreviewProvider {
    static var previews: some View {
        MediaRowView(media: Media(id: 631843, title: "Old", overview: "A group of families on a tropical holiday discover that the secluded beach where they are staying is somehow causing them to age rapidly – reducing their entire lives into a single day.", poster: "/qPKw2w4Ya5ZoOaxUDK1czRskQBT.jpg", voteAvg: 6.7, genres: ["Mystery","Thriller","Horror"], releaseDate: "2021-07-21"))
    }
}
