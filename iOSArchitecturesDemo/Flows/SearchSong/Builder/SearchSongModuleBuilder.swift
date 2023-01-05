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
        let router = SearchRouter()
        let interactor = SearchSongsInteractor()
        let presenter = SearchSongPresenter(interactor: interactor, router: router)
        let viewController = SearchSongViewController(presenter: presenter)
        presenter.viewInput = viewController
        router.viewController = viewController
        return viewController
    }
}
