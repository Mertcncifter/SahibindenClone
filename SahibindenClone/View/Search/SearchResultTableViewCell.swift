//
//  SearchResultTableViewCell.swift
//  SahibindenClone
//
//  Created by mert can çifter on 30.03.2023.
//

import UIKit
import SnapKit
import SDWebImage

class SearchResultTableViewCell: UITableViewCell {
    
    static let identifier = "SearchResultTableViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .systemGray2
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .customBlue
        label.font = .systemFont(ofSize: 13, weight: .semibold)

        return label
    }()
        
    private let customImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let locationImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "location")?.withTintColor(.systemGray2, renderingMode: .alwaysOriginal)
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(addressLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(customImage)
        contentView.addSubview(locationImage)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        customImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(5)
            make.bottom.equalTo(contentView.snp.top).offset(5)
            make.height.equalTo(contentView.snp.height)
            make.width.equalTo(100)
            make.left.equalTo(contentView.snp.left)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(5)
            make.left.equalTo(customImage.snp.right).offset(10)
            make.right.equalTo(contentView.snp.right).offset(5)
        }
        
        locationImage.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).offset(-5)
            make.left.equalTo(customImage.snp.right).offset(10)
        }
        
        addressLabel.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).offset(-5)
            make.left.equalTo(locationImage.snp.right).offset(2)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).offset(-5)
            make.right.equalTo(contentView.snp.right).offset(-5)
        }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        customImage.image = nil
        titleLabel.text = nil
        addressLabel.text = nil
        priceLabel.text = nil
    }
    
    func configure(with model: SearchResultItem) {
        titleLabel.text = model.title
        addressLabel.text = "\(model.city),\(model.district)"
        priceLabel.text = "\(Helper.df2so(model.price)) TL"
        
        let randomInt = Int.random(in: 0..<100)
        customImage.sd_setImage(with: URL(string: "https://source.unsplash.com/random/200x200?sig=\(randomInt)"))
    }
}
