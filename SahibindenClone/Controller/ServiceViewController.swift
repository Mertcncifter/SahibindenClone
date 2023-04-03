//
//  ServiceViewController.swift
//  SahibindenClone
//
//  Created by mert can çifter on 24.03.2023.
//

import UIKit




class ServiceViewController: UIViewController {

    
    // MARK: - Properties
    
    private var sections = [Section]()

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero,style: .grouped)
        tableView.backgroundColor = .systemBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureModels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Servisler"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    

    // MARK: - Helpers

    func configureUI(){
        view.backgroundColor = .systemBackground
        configureTableView()
    }
    
    private func configureTableView(){
        view.addSubview(tableView)
        let bgView = UIView()
        bgView.backgroundColor = .systemBackground
        tableView.backgroundView = bgView
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func configureModels() {
        sections.append(Section(title: "", options: [
            Option(title: "Oto360",subTitle: "Araç Alım/Satım işlemleriniz de İhtiyacınız Olan Tüm Servisler sahibinden.com'da",icon: "", handler: {  }),
            Option(title: "Emlak360",subTitle: "Emlak Alım/Satım/Kiralama İşlemlerinizde İhtiyacınız Olan Tüm Servisler sahibinden.com'da!",icon: "", handler: {  })
         ]))
        
    }
    

}


extension ServiceViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].options.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = sections[indexPath.section].options[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = "\(model.title)"
        cell.imageView?.image = UIImage(systemName: "car")?.withRenderingMode(.alwaysOriginal).withTintColor(.customOrange)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = sections[indexPath.section].options[indexPath.row]
        model.handler()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let model = sections[section]
        return model.title
    }
}

