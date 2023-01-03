//
//  SearchSongModuleBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Aleksandr Derevenskih on 03.01.2023.
//  Copyright © 2023 ekireev. All rights reserved.
//

import UIKit

class SearchSongModuleBuilder {
    static func build() -> (UIViewController & SearchSongViewInput) {
        let presenter = SearchSongPresenter()
        let viewController = SearchSongViewController(presenter: presenter)
        presenter.viewInput = viewController
        return viewController
    }
}
