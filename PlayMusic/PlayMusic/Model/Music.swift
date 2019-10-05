//
//  Music.swift
//  PlayMusic
//
//  Created by Trinh Thai on 10/5/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import Foundation

class Music {    
    public private(set) var singerName: String = ""
    public private(set) var songName: String = ""
    public private(set) var image: String = ""
    
    init(singerName: String, songName: String, image: String) {
        self.singerName = singerName
        self.songName = songName
        self.image = image
    }

}
