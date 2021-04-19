//
//  Song.swift
//  UI-164
//
//  Created by にゃんにゃん丸 on 2021/04/19.
//

import SwiftUI

struct Song: Identifiable {
    var id = UUID().uuidString
    var album_name : String
    var album_author : String
    var album_cover : String
}

var recentlyPlayed = [

Song(album_name: "I look out the window", album_author: "Cat Man", album_cover: "p2"),
    Song(album_name: "Without Hestaion", album_author: "Girl", album_cover: "p3"),
    Song(album_name: "Sea is beautiful", album_author: "hi guys", album_cover: "p4"),
    Song(album_name: "Never Stom", album_author: "You got this", album_cover: "p5"),
]

 var likedSong = [
    
   
    Song(album_name: "Dog Eye", album_author: "DogMan", album_cover: "p6"),
    Song(album_name: "Apple City", album_author: "Apple Man", album_cover: "p7"),
    Song(album_name: "I got it!", album_author: "Hansom Boy", album_cover: "p8"),
    Song(album_name: "The Jeep", album_author: "Car", album_cover: "p9"),
    Song(album_name: "I loo out the far", album_author: "Animal", album_cover: "p10"),
    Song(album_name: "White liner", album_author: "Wash out", album_cover: "p11"),
    Song(album_name: "Leica", album_author: "Camera Man", album_cover: "p12"),
    Song(album_name: "Raibow", album_author: "Spiral", album_cover: "p13"),
    Song(album_name: "Reiver Wash", album_author: "The River", album_cover: "p14"),
    Song(album_name: "Watch Out San", album_author: "Shadow Girl", album_cover: "p15"),
    
 
 
 ]
var generes = ["Classic","Hip-Hop","Electronic","Chilout","Dark","Calm","Ambient","Dance"]
