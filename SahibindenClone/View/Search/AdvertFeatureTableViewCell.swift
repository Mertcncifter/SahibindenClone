//
//  AdvertFeatureTableViewCell.swift
//  SahibindenClone
//
//  Created by mert can çifter on 31.03.2023.
//

import UIKit

class AdvertFeatureTableViewCell: UITableViewCell {

    static let identifier = "AdvertFeatureTableViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        return label
    }()
    
    private let descLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descLabel)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
       titleLabel.snp.makeConstraints { make in
           make.left.equalTo(contentView.snp.left).offset(15)
           make.centerY.equalTo(contentView)
       }
        
       descLabel.snp.makeConstraints { make in
           make.right.equalTo(contentView.snp.right).offset(-15)
           make.centerY.equalTo(contentView)
       }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        descLabel.text = nil
    }
    
    func configure(with model: AddionatalFeature) {
        titleLabel.text = model.title
        descLabel.text = model.desc
    }
}
