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
    var width: CGFloat
    
    var body: some View {
        
        VStack{
            KFImage(URL(string: "\(imageURL)\(media.poster)"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width-40)
                .cornerRadius(40)
                .overlay(
                    ZStack{
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.green, style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                        VStack{
                            Spacer()
                            HStack{
                                RateView(rate: media.voteAvg*10)
                                    .padding(.leading, 35)
                                    .padding(.leading, -35)
                                Spacer()
                            }
                        }
                    }
                    
                ).padding(.top, 10)
            Text(media.title)
                .font(.largeTitle)
                .padding(.top, 40)
            Text(media.releaseDate)
                .font(.headline)
                .padding(.top)
        } .padding(.horizontal, 20)
        
    }
}

struct MediaRowView_Previews: PreviewProvider {
    static var previews: some View {
        MediaRowView(media: Media(id: 631843, title: "Old", overview: "A group of families on a tropical holiday discover that the secluded beach where they are staying is somehow causing them to age rapidly – reducing their entire lives into a single day.", poster: "/qPKw2w4Ya5ZoOaxUDK1czRskQBT.jpg", voteAvg: 6.7, genres: ["Mystery","Thriller","Horror"], releaseDate: "2021-07-21"),
                     width: 300)
    }
}
