//
//  NewsStorage.swift
//  VK
//
//  Created by Lera on 04.07.22.
//

import UIKit
import Foundation

class NewsStorage {
    let news: [News]
    
    init() {
        news = [
            News(avatar: UIImage(named: "animalPlanet"),
                 name: "Animal Planet",
                 date: "26.07.2021",
                 text: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.",
                 image1: UIImage(named: "animalPlanet"),
                 likes: UInt.random(in: 0..<255),
                 comments: UInt.random(in: 0..<255),
                 replies: UInt.random(in: 0..<255),
                 views: UInt.random(in: 0..<255)),
            News(avatar: UIImage(named: "discoveryScience"),
                 name: "Discovery Science",
                 date: "26.07.2021",
                 text: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.",
                 image1: UIImage(named: "discoveryScience"),
                 likes: UInt.random(in: 0..<255),
                 comments: UInt.random(in: 0..<255),
                 replies: UInt.random(in: 0..<255),
                 views: UInt.random(in: 0..<255)),
            News(avatar: UIImage(named: "militaryHistory"),
                 name: "Military History",
                 date: "26.07.2021",
                 text: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.",
                 image1: UIImage(named: "militaryHistory"),
                 likes: UInt.random(in: 0..<255),
                 comments: UInt.random(in: 0..<255),
                 replies: UInt.random(in: 0..<255),
                 views: UInt.random(in: 0..<255)),
            News(avatar: UIImage(named: "investigationDiscovery"),
                 name: "Investigation Discovery",
                 date: "26.07.2021",
                 text: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.",
                 image1: UIImage(named: "investigationDiscovery"),
                 likes: UInt.random(in: 0..<255),
                 comments: UInt.random(in: 0..<255),
                 replies: UInt.random(in: 0..<255),
                 views: UInt.random(in: 0..<255)),
        ]
    }
}
