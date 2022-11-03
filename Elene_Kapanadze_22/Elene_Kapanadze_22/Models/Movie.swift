//
//  Movie.swift
//  Elene_Kapanadze_22
//
//  Created by Ellen_Kapii on 13.08.22.
//

import UIKit

struct Movie: Decodable {
    
    let results: [MovieData]
    
}

struct MovieData: Decodable {
    
    let poster_path: String?
    let id: Int
    let vote_average: Double
    let overview: String
    let origin_country: [String]
    let first_air_date: String
    let vote_count: Int
    let name: String
    let original_name: String
}

extension UIImageView {
    
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}



//"poster_path": "/tfdiVvJkYMbUOXDWibPjzu5dY6S.jpg",
//"popularity": 1.722162,
//"id": 604,
//"backdrop_path": "/hHwEptckXUwZM7XO2lxZ8w8upuU.jpg",
//"vote_average": 8.17,
//"overview": "Teen Titans is an American animated television series based on the DC Comics characters of the same name, primarily the run of stories by Marv Wolfman and George Pérez in the early-1980s The New Teen Titans comic book series. The show was created by Glen Murakami, developed by David Slack, and produced by Warner Bros. Animation. It premiered on Cartoon Network on July 19, 2003 with the episode \"Divide and Conquer\" and the final episode \"Things Change\" aired on January 16, 2006, with the film Teen Titans: Trouble in Tokyo serving as the series finale. A comic book series, Teen Titans Go!, was based on the TV series. On June 8, 2012, it was announced that the series would be revived as Teen Titans Go! in April 23, 2013 and air on the DC Nation block.IT now airs on the Boomerang channel. ",
//"first_air_date": "2003-07-19",
//"origin_country": [
//    "US"
