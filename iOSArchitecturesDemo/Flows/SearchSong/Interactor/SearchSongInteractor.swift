//
//  SearchInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Aleksandr Derevenskih on 05.01.2023.
//  Copyright © 2023 ekireev. All rights reserved.
//

import Foundation
import Alamofire

protocol SearchSongsInteractorInput {
    func requestSongs(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void)
}

final class SearchSongsInteractor: SearchSongsInteractorInput {
    private let searchService = ITunesSearchService()
    func requestSongs(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void) {
        self.searchService.getSongs(forQuery: query, completion: completion)        
    }
}
