//
//  navbarView.swift
//  Allon Pathology
//
//  Created by Malik Farhan Asim on 26/04/2021.
//

import UIKit

class navbarView: UIView {

    static let shared = navbarView()
    
    let navbg_image = ImageView(imageName: "navbarbg_icon")
    let humburger = ImageView(imageName: "hamburger")
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(navbg_image)
        addSubview(humburger)

        NSLayoutConstraint.activate([
            navbg_image.leadingAnchor.constraint(equalTo: self.leadingAnchor , constant: -48.widthRatio),
            navbg_image.trailingAnchor.constraint(equalTo: self.trailingAnchor , constant: 48.widthRatio),
            navbg_image.topAnchor.constraint(equalTo: self.topAnchor),
            navbg_image.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        
            humburger.widthAnchor.constraint(equalToConstant: 30.widthRatio),
            humburger.heightAnchor.constraint(equalTo: humburger.widthAnchor),
            humburger.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30.widthRatio),
            humburger.topAnchor.constraint(equalTo: self.topAnchor, constant: 110.heightRatio),
            
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
