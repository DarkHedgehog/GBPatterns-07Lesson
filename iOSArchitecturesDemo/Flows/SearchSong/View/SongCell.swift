//
//  AppCell.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Kireev on 01/03/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

final class SongCell: UITableViewCell {

    // MARK: - Private Properties
    private struct Constants {
        static let notesName = "notes"
    }

    // MARK: - Subviews
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()
    
    private(set) lazy var albumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12.0)
        return label
    }()

    private(set) lazy var artworkImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true

        return imageView
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - Methods
    
    func configure(with cellModel: SongCellModel) {
        self.titleLabel.text = cellModel.title
        self.artistLabel.text = cellModel.artist
        self.albumLabel.text = cellModel.album
        self.artworkImage.image = UIImage(named: Constants.notesName)
    }
    
    // MARK: - UI
    
    override func prepareForReuse() {
        [self.titleLabel, self.artistLabel, self.albumLabel].forEach { $0.text = nil }
    }
    
    private func configureUI() {
        self.addArtworkImage()
        self.addTitleLabel()
        self.addArtistLabel()
        self.addAlbumLabel()
    }

    private func addArtworkImage() {
        self.contentView.addSubview(self.artworkImage)
        NSLayoutConstraint.activate([
            self.artworkImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0.0),
            self.artworkImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 8.0),
            self.artworkImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.artworkImage.widthAnchor.constraint(equalToConstant: 64)
            ])
    }

    private func addTitleLabel() {
        self.contentView.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.titleLabel.leftAnchor.constraint(equalTo: self.artworkImage.rightAnchor, constant: 12.0),
            self.titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addArtistLabel() {
        self.contentView.addSubview(self.artistLabel)
        NSLayoutConstraint.activate([
            self.artistLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 4.0),
            self.artistLabel.leftAnchor.constraint(equalTo: self.artworkImage.rightAnchor, constant: 12.0),
            self.artistLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addAlbumLabel() {
        self.contentView.addSubview(self.albumLabel)
        NSLayoutConstraint.activate([
            self.albumLabel.topAnchor.constraint(equalTo: self.artistLabel.bottomAnchor, constant: 4.0),
            self.albumLabel.leftAnchor.constraint(equalTo: self.artworkImage.rightAnchor, constant: 12.0),
            self.albumLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
}
