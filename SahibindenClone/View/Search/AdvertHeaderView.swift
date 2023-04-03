//
//  AdvertHeaderView.swift
//  SahibindenClone
//
//  Created by mert can çifter on 31.03.2023.
//

import UIKit
import SnapKit
import ImageSlideshow
import ImageSlideshowSDWebImage



class AdvertHeaderView: UIView {
    
    static let identifier = "AdvertHeaderView"
    
    // MARK: - Properties
    
    private let slideshow: ImageSlideshow = {
        let slideshow = ImageSlideshow()
        slideshow.slideshowInterval = 5.0
        slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill

        slideshow.pageIndicator = UIPageControl.withSlideshowColors()

        slideshow.activityIndicator = DefaultActivityIndicator()

        return slideshow
    }()
    
    let sdWebImageSource = [SDWebImageSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, SDWebImageSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, SDWebImageSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]

    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureImageSlider()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Helpers

    
    private func configureUI() {
        
        
        addSubview(slideshow)
        
        slideshow.snp.makeConstraints { make in
            make.height.equalTo(300)
            make.width.equalTo(snp.width)
        }
    
    }
    
    private func configureImageSlider(){
        slideshow.setImageInputs(sdWebImageSource)
        slideshow.delegate = self
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        slideshow.addGestureRecognizer(recognizer)
    }
    
    // MARK: - Selectors
    
    @objc func didTap() {
        //let fullScreenController = slideshow.presentFullScreenController(from: self)
        //fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    
}


extension AdvertHeaderView: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("current page:", page)
    }
}
