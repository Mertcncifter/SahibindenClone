//
//  SearchDetailViewController.swift
//  SahibindenClone
//
//  Created by mert can çifter on 27.03.2023.
//

import UIKit
import SnapKit

class SearchDetailViewController: UIViewController {

    // MARK: - Properties
    
    private var models = [CategoryDetailModel]()
    
    private var categoryModel: CategoryModel

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero,style: .grouped)
        tableView.backgroundColor = .systemBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    init(categoryModel: CategoryModel) {
        self.categoryModel = categoryModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        configureUI()
        configureModels()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    // MARK: - Helpers

    private func configureUI(){
        view.backgroundColor = .systemBackground
        configureTableView()
    }
    
    private func configureTableView(){
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    

    private func configureModels() {
        
        switch categoryModel.type {
        case .estate:
            models = CategoryDetailModel.estateData
        case .vehicle:
            models = CategoryDetailModel.estateData
        case .piece:
            models = CategoryDetailModel.estateData
        case .shopping:
            models = CategoryDetailModel.estateData
        case .machine:
            models = CategoryDetailModel.estateData
        case .service:
            models = CategoryDetailModel.estateData
        case .lesson:
            models = CategoryDetailModel.estateData
        case .job:
            models = CategoryDetailModel.estateData
        case .helper:
            models = CategoryDetailModel.estateData
        case .animal:
            models = CategoryDetailModel.estateData
        case .urgent:
            models = CategoryDetailModel.estateData
        case .last48hours:
            models = CategoryDetailModel.estateData
        default:
            break
        }

    }
    
}

// MARK: - UITableViewDelegate


extension SearchDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if models.isEmpty {
            return UIView()
        }
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "cell")
        headerCell?.backgroundColor = .secondarySystemGroupedBackground
        headerCell?.textLabel?.text = tableHeaderTitle()
        headerCell?.textLabel?.textColor = .blue
        headerCell?.accessoryType = .disclosureIndicator
        
        let image = UIImage(systemName: "chevron.forward")
        let checkmark = UIImageView(frame:CGRect(x:0, y:0, width:(image?.size.width)!, height:(image?.size.height)!));
        checkmark.image = image
        
        headerCell?.accessoryView = checkmark
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTapHeader(_:)))
        headerCell?.addGestureRecognizer(tap)
        headerCell?.isUserInteractionEnabled = true
                
        return headerCell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = model.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = models[indexPath.row]
        
        let vc = SearchFilterResultViewController(categoryType: categoryModel.type)
        vc.title = model.title
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension SearchDetailViewController {
    private func tableHeaderTitle () -> String {
        switch categoryModel.id {
        case 1:
            return "Tüm Emlak İlanları"
        default:
            return ""
        }
    }
}


extension SearchDetailViewController {
    
    @objc func handleTapHeader(_ sender: UITapGestureRecognizer) {
         
    }
}
