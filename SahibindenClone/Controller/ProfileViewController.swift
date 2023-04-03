//
//  ProfileViewController.swift
//  SahibindenClone
//
//  Created by mert can çifter on 24.03.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - Properties
    
    private var sections = [Section]()

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero,style: .grouped)
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
        self.tabBarController?.navigationItem.title = "Bana Özel"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    // MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = .systemGroupedBackground
        configureTableView()
    }
    
    private func configureTableView(){
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func configureModels() {
        sections.append(
            Section(title: "İLAN YÖNETİMİ", options: [
                Option(title: "Yayında Olanlar",subTitle: "",icon: "", handler: {  }),
                Option(title: "Yayında Olmayanlar",subTitle: "",icon: "", handler: {  }),
                Option(title: "İlana QR Kod ile Fotoğraf ekleme",subTitle: "",icon: "", handler: {  })
            ])
        )
        
        sections.append(
            Section(title: "MESAJLAR VE BİLGİLENDİRMELER", options: [
                Option(title: "Mesajlar",subTitle: "",icon: "", handler: {  }),
                Option(title: "Bilgilendirmeler",subTitle: "",icon: "", handler: {  }),
            ])
        )
        
        sections.append(
            Section(title: "FAVORİLER", options: [
                Option(title: "Favori İlanlar",subTitle: "",icon: "", handler: {  }),
                Option(title: "Favori Aramalar",subTitle: "",icon: "", handler: {  }),
                Option(title: "Favori Satıcılar",subTitle: "",icon: "", handler: {  })
            ])
        )
        
        sections.append(
            Section(title: "", options: [
                Option(title: "Size Özel İlanlar",subTitle: "",icon: "", handler: {  }),
            ])
        )
        
        sections.append(
            Section(title: "", options: [
                Option(title: "Karşılaştırma Listesi",subTitle: "",icon: "", handler: {  }),
            ])
        )
    }

}


extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].options.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = sections[indexPath.section].options[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = "\(model.title)"
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

