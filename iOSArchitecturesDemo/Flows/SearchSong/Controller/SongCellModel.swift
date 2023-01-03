//
//  AppCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Kireev on 02/06/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import Foundation

struct SongCellModel {
    let title: String
    let artist: String?
    let album: String?
}

final class SongCellModelFactory {
    
    static func cellModel(from model: ITunesSong) -> SongCellModel {
        return SongCellModel(title: model.trackName,
                            artist: model.artistName,
                             album: model.collectionName)
    }
}
