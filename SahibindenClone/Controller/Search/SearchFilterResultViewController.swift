//
//  SearchFilterResultViewController.swift
//  SahibindenClone
//
//  Created by mert can çifter on 29.03.2023.
//

import UIKit


class SearchFilterResultViewController: UIViewController {
    
    // MARK: - Properties

    private var categoryType: CategoryType
    
    private var models = [SearchResultItem]()

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero,style: .grouped)
        tableView.backgroundColor = .systemBackground
        tableView.register(SearchResultTableViewCell.self, forCellReuseIdentifier: SearchResultTableViewCell.identifier)
        
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    init(categoryType: CategoryType) {
        self.categoryType = categoryType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureModels()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    // MARK: - Helpers

    private func configureUI(){
        self.navigationController?.navigationBar.tintColor = UIColor.white
        view.backgroundColor = .systemBackground
        configureTableView()
    }
    
    private func configureTableView(){
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func configureModels() {
        
        switch categoryType {
        case .estate:
            models = SearchResultItem.estateResult
        case .vehicle:
            models = SearchResultItem.estateResult
        case .piece:
            models = SearchResultItem.estateResult
        case .shopping:
            models = SearchResultItem.estateResult
        case .machine:
            models = SearchResultItem.estateResult
        case .service:
            models = SearchResultItem.estateResult
        case .lesson:
            models = SearchResultItem.estateResult
        case .job:
            models = SearchResultItem.estateResult
        case .helper:
            models = SearchResultItem.estateResult
        case .animal:
            models = SearchResultItem.estateResult
        case .urgent:
            models = SearchResultItem.estateResult
        case .last48hours:
            models = SearchResultItem.estateResult
        default:
            break
        }
    }
    
    
}



// MARK: - UITableViewDelegate


extension SearchFilterResultViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier,
                                                       for: indexPath) as? SearchResultTableViewCell else {
            return UITableViewCell()
        }
        
        
        let model = models[indexPath.row]
        cell.configure(with: model)
        cell.accessoryType = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = models[indexPath.row]
                
        let vc = AdvertFullDetailViewController(model: model)
        vc.title = "İlan Detayı"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

