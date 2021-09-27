//
//  ContentView.swift
//  App05_TMDB
//
//  Created by Alumno on 27/09/21.
//

import SwiftUI

struct TMDBView: View {
    @StateObject var mediaModel = MediaModel() //property wrapper prepared for reading all changes on mediaModel
    
    var body: some View {
        NavigationView{
            //            List{ //creates a list of genres do be displayed
            //                ForEach(mediaModel.genres) {
            //                    genre in
            //                    Text(genre.name)
            //                }
            //            }
            TabView{
                MoviesView(mediaModel: MediaModel())
                    .tabItem{
                        Label("Movies", systemImage: "film.fill")
                    }
                SeriesView()
                    .tabItem{
                        Label("Series", systemImage: "tv.fill")
                    }
            }
            
            .navigationBarTitle("Catalogue", displayMode: .inline)
        }
    }
}

struct TMDBView_Previews: PreviewProvider {
    static var previews: some View {
        TMDBView()
    }
}

