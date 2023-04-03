//
//  AdvertFullDetailViewController.swift
//  SahibindenClone
//
//  Created by mert can çifter on 31.03.2023.
//

import UIKit
import SnapKit
import MapKit



class AdvertFullDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private var model: SearchResultItem

    private let headerView = AdvertHeaderView()
    
    private lazy var advertDetailTabItem: UIView = {
        return templateTabView(title: "İlan Detayları", tag: 0,color: .customOrange)
    }()
    
    private lazy var advertDescTabItem: UIView = {
        return templateTabView(title: "Açıklama", tag: 1,color: .white)
    }()
    
    private lazy var advertLocationTabItem: UIView = {
        return templateTabView(title: "Konum", tag: 2,color: .white)
    }()
    
    private lazy var advertTabStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [advertDetailTabItem,advertDescTabItem,advertLocationTabItem])
        view.axis = .horizontal
        view.spacing = 5
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .customOrange
        return view
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero,style: .grouped)
        tableView.backgroundColor = .systemBackground
        tableView.register(AdvertFeatureTableViewCell.self, forCellReuseIdentifier: AdvertFeatureTableViewCell.identifier)
        return tableView
    }()
    
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.isHidden = true
        return mapView
    }()

    
    // MARK: - Lifecycle

    init(model: SearchResultItem) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    

    // MARK: - Helpers
    
    private func configureUI() {
        self.navigationController?.navigationBar.tintColor = UIColor.white
        view.backgroundColor = .systemBackground
        configureTableView()
    }
    
    
    private func configureTableView(){
        
        view.addSubview(headerView)
        
        headerView.snp.makeConstraints { make in
            make.height.equalTo(300)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        }
                
        view.addSubview(advertTabStackView)
        
        advertTabStackView.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.top.equalTo(headerView.snp.bottom)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
        }
        
        view.addSubview(underlineView)
        
        underlineView.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.top.equalTo(advertTabStackView.snp.bottom)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(underlineView.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
            
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(mapView)

        mapView.snp.makeConstraints { make in
            make.top.equalTo(advertTabStackView.snp.bottom).offset(10)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
    
    private func templateTabView(title: String,tag: Int,color: UIColor) -> UIView {
        let itemWidth = (view.width - 50) / 3
        let view = UIView()
        view.backgroundColor = color
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        let customLabel = UILabel()
        customLabel.numberOfLines = 1
        customLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        view.addSubview(customLabel)
        customLabel.text = title
        customLabel.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        view.snp.makeConstraints { make in
            make.width.equalTo(itemWidth)
        }
        
        view.tag = tag
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleSegmentChange(_:)))
        view.addGestureRecognizer(tap)
       
        return view
    }
    
    // MARK: - Selectors
    
    @objc func handleSegmentChange(_ sender: UITapGestureRecognizer? = nil) {
        
        switch sender?.view?.tag {
        case 0:
            tableView.isHidden = false
            mapView.isHidden = true
            advertDetailTabItem.backgroundColor = .customOrange
            advertDescTabItem.backgroundColor = .white
            advertLocationTabItem.backgroundColor = .white
        case 1:
            tableView.isHidden = true
            mapView.isHidden = true
            advertDetailTabItem.backgroundColor = .white
            advertDescTabItem.backgroundColor = .customOrange
            advertLocationTabItem.backgroundColor = .white
           
        case 2:
            tableView.isHidden = true
            mapView.isHidden = false
            advertDetailTabItem.backgroundColor = .white
            advertDescTabItem.backgroundColor = .white
            advertLocationTabItem.backgroundColor = .customOrange
        default:
            break
        }
    }
  
}



// MARK: - UITableViewDelegate

extension AdvertFullDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.feature.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AdvertFeatureTableViewCell.identifier,
                                                       for: indexPath) as? AdvertFeatureTableViewCell else {
            return UITableViewCell()
        }
        
        let model = model.feature[indexPath.row]

        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



