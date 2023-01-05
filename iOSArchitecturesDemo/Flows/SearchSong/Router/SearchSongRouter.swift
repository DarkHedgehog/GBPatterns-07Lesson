//
//  SearchSongRouterInput.swift
//  iOSArchitecturesDemo
//
//  Created by Aleksandr Derevenskih on 05.01.2023.
//  Copyright © 2023 ekireev. All rights reserved.
//

import UIKit

protocol SearchRouterInput {
    func openDetails(for song: ITunesSong)
    func openAppInITunes(_ song: ITunesSong)
}

final class SearchRouter: SearchRouterInput {
    weak var viewController: UIViewController?

    func openDetails(for song: ITunesSong) {
        // TODO: Song Detail open
    }

    func openAppInITunes(_ song: ITunesSong) {
        guard let urlString = song.trackUrl, let url = URL(string: urlString) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
