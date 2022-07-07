//
//  ExploreCollectionViewCell.swift
//  EKO
//
//  Created by Anderson Bezerra on 06/07/22.
//

import UIKit

class ExploreCollectionViewCell: UICollectionViewCell {
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "ArchivoRoman-ExtraBold", size: 72)//UIFont.systemFont(ofSize: 24, weight: .bold)
        title.text = "EXPLORE"
        title.textColor = .redEKO
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ExploreCollectionViewCell: ViewCode {
    func buildViewHierarchy() {
        contentView.addSubview(titleLabel)

    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
