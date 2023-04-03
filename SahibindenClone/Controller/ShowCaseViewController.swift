//
//  ShowCaseViewController.swift
//  SahibindenClone
//
//  Created by mert can çifter on 24.03.2023.
//

import UIKit

class ShowCaseViewController: UIViewController {

    // MARK: - Properties

    private var models: [SearchResultItem] = SearchResultItem.estateResult
    
    private lazy var collectionView = UICollectionView(frame: .zero,collectionViewLayout:
         UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(0.2)))
        item.contentInsets.bottom = 16
        item.contentInsets.trailing = 16
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1000)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 32, leading: 16, bottom: 0, trailing: 0)
        
        return section
        
    })
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Vitrin"
    }
    

    // MARK: - Helpers

    private func configureUI(){
        view.backgroundColor = .systemBackground
        configureCollectionView()
    }
    
    
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.register(ShowCaseCollectionViewCell.self, forCellWithReuseIdentifier: ShowCaseCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ShowCaseViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShowCaseCollectionViewCell.identifier, for: indexPath) as? ShowCaseCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.layer.borderColor = UIColor.systemGray2.cgColor
        cell.layer.borderWidth = 1
        let model = models[indexPath.row]
        cell.configure(title: model.title)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = models[indexPath.row]
        
        let vc = AdvertFullDetailViewController(model: model)
        vc.title = "İlan Detayı"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
}



