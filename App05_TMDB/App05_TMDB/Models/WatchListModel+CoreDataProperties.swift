//
//  WatchListModel+CoreDataProperties.swift
//  App05_TMDB
//
//  Created by Alumno on 18/10/21.
//
//

import Foundation
import CoreData


extension WatchListModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WatchListModel> {
        return NSFetchRequest<WatchListModel>(entityName: "WatchListModel")
    }

    @NSManaged public var id: Int32
    @NSManaged public var overview: String?
    @NSManaged public var voteAvg: Double
    @NSManaged public var title: String?
    @NSManaged public var poster: String?
    @NSManaged public var genres: [String]
    @NSManaged public var releaseDate: String?
    @NSManaged public var isMovie: Bool
    
    
    var overview_wrapped: String{
        overview ?? ""
    }
    var title_wrapped: String{
        title ?? ""
    }
    var poster_wrapped: String{
        poster ?? ""
    }
    var release_date_wrapped: String{
        releaseDate ?? ""
    }

}

extension WatchListModel : Identifiable {

}
