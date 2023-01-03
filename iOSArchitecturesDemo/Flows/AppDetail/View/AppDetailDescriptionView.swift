//
//  AppDetailAboutView.swift
//  iOSArchitecturesDemo
//
//  Created by Aleksandr Derevenskih on 31.12.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class AppDetailDescriptionView: UIView {
    // MARK: - Subviews

    private(set) lazy var whatsNewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 1
        return label
    }()

    private(set) lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 1
        return label
    }()

    private(set) lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 1
        return label
    }()

    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.numberOfLines = 10
        return label
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupLayout()
    }

    // MARK: - UI
    private func setupLayout() {
        self.addSubview(self.whatsNewLabel)
        self.addSubview(self.versionLabel)
        self.addSubview(self.releaseDateLabel)
        self.addSubview(self.descriptionLabel)
        NSLayoutConstraint.activate([
            self.whatsNewLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.whatsNewLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.whatsNewLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            self.versionLabel.topAnchor.constraint(equalTo: self.whatsNewLabel.bottomAnchor, constant: 12.0),
            self.versionLabel.widthAnchor.constraint(equalToConstant: 120),
            self.versionLabel.leftAnchor.constraint(equalTo: self.whatsNewLabel.leftAnchor),
            self.releaseDateLabel.topAnchor.constraint(equalTo: self.versionLabel.topAnchor),
            self.releaseDateLabel.leftAnchor.constraint(equalTo: self.versionLabel.rightAnchor, constant: 10.0),
            self.releaseDateLabel.rightAnchor.constraint(equalTo: self.whatsNewLabel.rightAnchor),
            self.descriptionLabel.topAnchor.constraint(equalTo: self.versionLabel.bottomAnchor),
            self.descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            self.descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16.0),
        ])
    }
}
