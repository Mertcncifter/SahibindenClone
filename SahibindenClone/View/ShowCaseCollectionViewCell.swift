//
//  ShowCaseCollectionViewCell.swift
//  SahibindenClone
//
//  Created by mert can çifter on 4.04.2023.
//

import UIKit
import SnapKit

class ShowCaseCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: ShowCaseCollectionViewCell.self)


    // MARK: - Properties
        
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 11)
        label.textAlignment = .center
        return label
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviews() {
        let randomInt = Int.random(in: 0..<100)
        imageView.sd_setImage(with: URL(string: "https://source.unsplash.com/random/200x200?sig=\(randomInt)"))
        
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.right.equalTo(contentView.snp.right)
            make.left.equalTo(contentView.snp.left)
            make.height.equalTo(150)
        }
        
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.right.equalTo(contentView.snp.right)
            make.left.equalTo(contentView.snp.left)
            make.bottom.equalTo(contentView.snp.bottom).offset(-5)
        }
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
        
}
