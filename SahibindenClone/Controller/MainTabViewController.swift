//
//  MainTabViewController.swift
//  SahibindenClone
//
//  Created by mert can çifter on 24.03.2023.
//

import UIKit
import SnapKit

class MainTabViewController: UITabBarController {


    // MARK: - Properties

    private let rightBarButtonImage: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        iv.image = UIImage(named: "sLogo")
        return iv
    }()
    
    
    // MARK: - Lifecyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - Helpers

    func configureUI(){
        configureTabBarAppereance()
        configureViewControllers()
    }
    
    
    func configureTabBarAppereance(){
        let appearance = UITabBarAppearance()
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .systemGroupedBackground
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
            tabBar.tintColor = .label
        }
        else{
            tabBar.standardAppearance = appearance
            tabBar.tintColor = .label
        }
    }
    
    func configureViewControllers(){
                
        let vc1 = templateNavigationController(rootViewController: ShowCaseViewController(), image: UIImage(systemName: "rectangle.split.2x2.fill"), title: "Vitrin")
        let vc2 = templateNavigationController(rootViewController: SearchViewController(), image: UIImage(systemName: "magnifyingglass"), title: "Arama")
        let vc3 = UIViewController()
        vc3.title = "İlan ver"
        let vc4 = templateNavigationController(rootViewController: ServiceViewController(), image: UIImage(systemName: "clock.arrow.2.circlepath"), title: "Servisler")
        let vc5 = templateNavigationController(rootViewController: ProfileViewController(), image: UIImage(systemName: "person"), title: "Bana Özel")
  
        setViewControllers([vc1,vc2,vc3,vc4,vc5], animated: true)
        
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(customView: rightBarButtonImage)
        ]
        
        
        setupMiddleButton()
    }
    
    
    func templateNavigationController(rootViewController : UIViewController,image : UIImage?,title: String?) -> UIViewController {
        rootViewController.tabBarItem.image = image
        rootViewController.tabBarItem.title = title
        return rootViewController
    }
    
    func setupMiddleButton() {
        let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        var menuButtonFrame = menuButton.frame
        menuButtonFrame.origin.y = view.bounds.height - menuButtonFrame.height - 55
        menuButtonFrame.origin.x = view.bounds.width / 2 - menuButtonFrame.size.width / 2
        menuButton.frame = menuButtonFrame

        menuButton.backgroundColor = UIColor(named: "middleButtonColor")
        menuButton.layer.cornerRadius = menuButtonFrame.height / 2
        view.addSubview(menuButton)
        let font = UIFont.systemFont(ofSize: 28)
        let config = UIImage.SymbolConfiguration(font: font)
        menuButton.setImage(UIImage(systemName: "plus",withConfiguration: config), for: .normal)
        menuButton.imageView?.tintColor = .white

        menuButton.addTarget(self, action: #selector(menuButtonAction(sender: )), for: .touchUpInside)

        view.layoutIfNeeded()
    }
    
    @objc private func menuButtonAction(sender: UIButton) {
        
    }

}
