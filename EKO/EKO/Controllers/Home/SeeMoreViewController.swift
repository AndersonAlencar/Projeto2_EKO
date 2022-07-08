//
//  SeeMoreViewController.swift
//  EKO
//
//  Created by Anderson Bezerra on 07/07/22.
//

import UIKit

class SeeMoreViewController: UIViewController {
    
    private lazy var titlePost: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "ArchivoItalic-Thin", size: 16)
        title.text = "Cymeima Aráuna"
        title.textAlignment = .center
        title.textColor = .magentaEKO
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var descriptionPost: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.font = UIFont(name: "ArchivoItalic-Thin", size: 20)
        title.text = "Araquém se descobriu fotografo ao primeiro contato de uma câmera, aos 15 anos começou a fotografar seus amigos e familiares e aos 20 já teve suas fotos expostas no MAUC (Museu de Arte da UFC). Nesse destaque suas lentes capturaram o processo da pintura corporal para a caçada e pesca em busca de alimentos. Seu irmão Cymeima foi o alvo de suas lentes junto do pajé que aplicava a coloração em sua pele."
        title.textAlignment = .justified
        title.textColor = .magentaEKO
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var acessoryView: UIView = {
        let acessoryView = UIView()
        acessoryView.backgroundColor = .black.withAlphaComponent(0.5)
        acessoryView.translatesAutoresizingMaskIntoConstraints = false
        return acessoryView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
    }
}

extension SeeMoreViewController: ViewCode {
    func configureViews() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background1.jpeg")!)
    }
    
    func buildViewHierarchy() {
        view.addSubview(acessoryView)
        view.addSubview(titlePost)
        view.addSubview(descriptionPost)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            acessoryView.topAnchor.constraint(equalTo: view.topAnchor),
            acessoryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            acessoryView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            acessoryView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titlePost.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titlePost.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            titlePost.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
        
        NSLayoutConstraint.activate([
            descriptionPost.topAnchor.constraint(equalTo: titlePost.bottomAnchor, constant: 20),
            descriptionPost.leadingAnchor.constraint(equalTo: acessoryView.leadingAnchor, constant: 35),
            descriptionPost.trailingAnchor.constraint(equalTo: acessoryView.trailingAnchor, constant: -35),
            descriptionPost.bottomAnchor.constraint(lessThanOrEqualTo: acessoryView.bottomAnchor)
        ])

    }
}
