//
//  SearchCategoryTableViewCell.swift
//  SahibindenClone
//
//  Created by mert can çifter on 26.03.2023.
//

import UIKit
import SnapKit

class SearchCategoryTableViewCell: UITableViewCell {
    
    static let identifier = "SearchCategoryTableViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.textColor = .systemGray2
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize : CGFloat = 35
        
        iconImageView.snp.makeConstraints { make in
            make.height.width.equalTo(imageSize)
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView.snp.left).offset(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(5)
            make.left.equalTo(iconImageView.snp.right).offset(10)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.left.equalTo(iconImageView.snp.right).offset(10)
        }
        
        iconImageView.layer.cornerRadius = imageSize / 2
        iconImageView.layer.masksToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        titleLabel.text = nil
        subtitleLabel.text = nil
    }
    
    func configure(with model: CategoryModel) {
        titleLabel.text = model.type.title
        subtitleLabel.text = model.type.subTitle
        iconImageView.image = UIImage(systemName: model.type.icon)?.withTintColor(.white,renderingMode: .alwaysOriginal)
        iconImageView.backgroundColor = model.type.color
        
        if model.type.subTitle.isEmpty {
            titleLabel.snp.makeConstraints { make in
                make.centerY.equalTo(iconImageView)
            }
        }
    }
}
