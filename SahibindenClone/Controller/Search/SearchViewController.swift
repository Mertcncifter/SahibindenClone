//
//  SearchViewController.swift
//  SahibindenClone
//
//  Created by mert can çifter on 24.03.2023.
//

import UIKit

struct SearchSection {
    let title: String
    let options: [SearchOption]
}

enum SearchOption {
    case standart(model: CategoryModel,handler: () -> Void)
    case urgent(model: CategoryModel,handler: () -> Void)
}


class SearchViewController: UIViewController,UISearchResultsUpdating, UISearchBarDelegate {

    // MARK: - Properties
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero,style: .grouped)
        tableView.backgroundColor = .systemBackground
        tableView.register(SearchCategoryTableViewCell.self,
                           forCellReuseIdentifier: SearchCategoryTableViewCell.identifier)
        
        return tableView
    }()
    
    let searchController: UISearchController = {
        let vc = UISearchController(searchResultsController: SearchResultViewController())
        vc.searchBar.placeholder = "Kelime veya ilan No. ile ara"
        vc.searchBar.searchBarStyle = .minimal
        vc.definesPresentationContext = true
        vc.searchBar.isHidden = false
        return vc
    }()
    
    private var sections = [SearchSection]()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureModels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Arama"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    // MARK: - Helpers

    private func configureUI(){
        view.backgroundColor = .systemBackground
        
        configureTableView()
        configureSearchController()
    }
    
    private func configureTableView(){
        view.addSubview(tableView)
        let bgView = UIView()
        bgView.backgroundColor = .systemBackground
        self.tableView.backgroundView = bgView
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        tableView.tableHeaderView = searchController.searchBar
    }
    
    private func configureModels() {
        
        let standartCategory = CategoryModel.exampleData.filter{$0.type != .urgent && $0.type != .last48hours}.map { model in
            return SearchOption.standart(model: model) {
                print("DEBUG \(model.type.title)")
                self.viewDetail(model: model)
            }
        }
        
        let urgentCategory = CategoryModel.exampleData.filter{$0.type == .urgent || $0.type == .last48hours}.map { model in
            return SearchOption.urgent(model: model) {
                print("DEBUG \(model.type.title)")
                self.viewDetail(model: model)

            }
        }
        
        
        self.sections = [
            SearchSection(title: "", options: standartCategory),
            SearchSection(title: "", options: urgentCategory)
        ]
        
    }
    
    private func viewDetail(model: CategoryModel){
        let vc = SearchDetailViewController(categoryModel: model)
        vc.title = model.type.title
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let models = sections[indexPath.section].options[indexPath.row]
        switch models {
        case .standart(let model,_):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchCategoryTableViewCell.identifier,
                                                           for: indexPath) as? SearchCategoryTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: model)
            return cell
        case .urgent(let model,_):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchCategoryTableViewCell.identifier,
                                                           for: indexPath) as? SearchCategoryTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: model)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let models = sections[indexPath.section].options[indexPath.row]
        
        switch models {
        case .standart(_,let handler):
           handler()
        case .urgent(_,let handler):
            handler()
        }
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let model = sections[section]
        return model.title
    }
}

extension SearchViewController {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}
