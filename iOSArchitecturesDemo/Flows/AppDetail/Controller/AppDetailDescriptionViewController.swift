//
//  AppDetailAboutViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Aleksandr Derevenskih on 31.12.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

final class AppDetailDescriptionViewController: UIViewController {
    // MARK: - Properties
    private let app: ITunesApp
    private var appDetailDescriptionView: AppDetailDescriptionView {
        return self.view as! AppDetailDescriptionView
    }
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter
    }()

    // MARK: - Init
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        self.view = AppDetailDescriptionView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
    }

    // MARK: - Private
    private func fillData() {
        self.appDetailDescriptionView.whatsNewLabel.text = "Что нового"
        self.appDetailDescriptionView.versionLabel.text = app.version
        if let releaseDate = app.releaseDate {
            self.appDetailDescriptionView.releaseDateLabel.text = dateFormatter.string(from: releaseDate)
        }
        self.appDetailDescriptionView.descriptionLabel.text = app.appDescription
    }
}
