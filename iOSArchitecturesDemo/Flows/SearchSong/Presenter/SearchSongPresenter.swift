//
//  SearchSongPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Aleksandr Derevenskih on 03.01.2023.
//  Copyright © 2023 ekireev. All rights reserved.
//

import UIKit

protocol SearchSongViewInput: class {
    var searchResults: [ITunesSong] { get set }
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
}

protocol SearchSongViewOutput: class {
    func viewDidSearch(with query: String)
    func viewDidSelectSong(_ app: ITunesSong)
}

class SearchSongPresenter {

    weak var viewInput: (UIViewController & SearchSongViewInput)?

    // MARK: - Private Properties

    private let searchService = ITunesSearchService()

    // MARK: - Private Functions

    private func requestSongs(with query: String) {
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else {
                return
            }

            self.viewInput?.throbber(show: false)
            result.withValue { songs in
                guard !songs.isEmpty else {
                    self.viewInput?.showNoResults()
                    return
                }
                self.viewInput?.hideNoResults()
                self.viewInput?.searchResults = songs
            } .withError {
                self.viewInput?.showError(error: $0)
            }
        }
    }

    private func openSongDetails(with Song: ITunesSong) {
//        let appDetaillViewController = DetailViewController(app: Song)
//        self.viewInput?.navigationController?.pushViewController(appDetaillViewController, animated: true)
    }
}

// MARK: - SearchViewOutput

extension SearchSongPresenter: SearchSongViewOutput {
    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        self.requestSongs(with: query)
    }

    func viewDidSelectSong(_ song: ITunesSong) {
        self.openSongDetails(with: song)
    }
}
