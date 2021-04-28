//
//  navbarView.swift
//  Allon Pathology
//
//  Created by Malik Farhan Asim on 26/04/2021.
//

import UIKit

class navbarView: UIView {

    let navbg_image = ImageView(imageName: "navbarbg_icon")
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(navbg_image)

        NSLayoutConstraint.activate([
            navbg_image.leadingAnchor.constraint(equalTo: self.leadingAnchor , constant: -48.widthRatio),
            navbg_image.trailingAnchor.constraint(equalTo: self.trailingAnchor , constant: 48.widthRatio),
            navbg_image.topAnchor.constraint(equalTo: self.topAnchor),
            navbg_image.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        
            
            
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {

    }
}
