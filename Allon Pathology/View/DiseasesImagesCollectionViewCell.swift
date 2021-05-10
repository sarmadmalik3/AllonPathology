//
//  DiseasesImagesCollectionViewCell.swift
//  Allon Pathology
//
//  Created by Sarmad Ishfaq on 10/05/2021.
//

import UIKit

class DiseasesImagesCollectionViewCell: UICollectionViewCell {

    let diasesImage = ImageView(imageName: "pathology_1")

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(diasesImage)
        diasesImage.layer.cornerRadius = 10.autoSized
        self.clipsToBounds = false
        self.applyShadow()
        NSLayoutConstraint.activate([
            
            diasesImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            diasesImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            diasesImage.topAnchor.constraint(equalTo: topAnchor),
            diasesImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
        
    }
    
    
    func populateData(diasesAlbum : DiseasesImagesModel){
        diasesImage.image = UIImage(named: diasesAlbum.image)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
