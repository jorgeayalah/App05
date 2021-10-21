//
//  WatchListRowView.swift
//  App05_TMDB
//
//  Created by Alumno on 21/10/21.
//

import SwiftUI
import Kingfisher

struct WatchListRowView: View {
    var media: WatchListModel
    var width: CGFloat
    
    var body: some View {
        VStack{
            KFImage(URL(string: "\(imageURL)\(media.poster_wrapped)"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width-40)
                .cornerRadius(40)
                .overlay(
                    ZStack{
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.green, style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                        
                        VStack{
                            HStack{
                                Spacer()
                                RemoveFromWatchListView(media: media)
                                    .padding(.trailing, 20)
                                    .padding(.top, 20)
                            }
                            Spacer()
                        }
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
            Text(media.title_wrapped)
                .font(.largeTitle)
                .padding(.top, 40)
            Text(media.release_date_wrapped)
                .font(.headline)
                .padding(.top)
        } .padding(.horizontal, 20)
    }
}

struct WatchListRowView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListRowView(media: WatchListModel(), width: 100)
    }
}
