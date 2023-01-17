//
//  AboutVC.swift
//  PlayingDice
//
//  Created by Samed Eryiğit on 18.01.2023.
//

import UIKit

class AboutVC: UIViewController {

    let titleLabel = UILabel()
    let myLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTitleLabel()
        configureMyLabel()
    }
    
    func configureTitleLabel(){
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "About"
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        titleLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func configureMyLabel(){
        view.addSubview(myLabel)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.text = "Developed by Samed Eryiğit on 18.01.2023 using Programmatic UI"
        myLabel.lineBreakMode = .byWordWrapping
        myLabel.numberOfLines = 2
        myLabel.textAlignment = .center
        myLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        NSLayoutConstraint.activate([
            myLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 35),
            myLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            myLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
}
