//
//  SearchModuleBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Rubtsov on 21.02.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class SearchAppModuleBuilder {
    static func build() -> (UIViewController & SearchAppViewInput) {
        let presenter = SearchAppPresenter()
        let viewController = SearchAppViewController(presenter: presenter)
        presenter.viewInput = viewController
        return viewController
    }
}
