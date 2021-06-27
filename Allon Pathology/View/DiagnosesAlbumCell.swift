//
//  DiagnosesAlbumCell.swift
//  Allon Pathology
//
//  Created by Sarmad Malik on 28/04/2021.
//

import UIKit
import SDWebImage

class DiagnosesAlbumCell: UICollectionViewCell {
    
    let containerView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.7803921569, green: 0.4784313725, blue: 0.8156862745, alpha: 1)
        view.layer.cornerRadius = 10.autoSized
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let diasesImage = ImageView(imageName: "sinuses_icon")
    let diasesName = Label(text: "SINES", textColor: .white, font: .setFont(fontName: .Poppins_Medium, fontSize: 18), alingment: .center)
    let contentContainerView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var isAnimated : Bool = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(containerView)
        containerView.addSubview(contentContainerView)
        contentContainerView.addSubview(diasesImage)
        diasesImage.layer.cornerRadius = 26.autoSized
        contentContainerView.addSubview(diasesName)
        self.clipsToBounds = false
        self.applyShadow()
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            contentContainerView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
//            contentContainerView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            contentContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor , constant: 5.autoSized),
            contentContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor , constant: -5.autoSized),
            
            diasesImage.widthAnchor.constraint(equalToConstant: 54.autoSized),
            diasesImage.heightAnchor.constraint(equalTo: diasesImage.widthAnchor),
            diasesImage.topAnchor.constraint(equalTo: contentContainerView.topAnchor),
            diasesImage.centerXAnchor.constraint(equalTo: contentContainerView.centerXAnchor),
            
            diasesName.leadingAnchor.constraint(equalTo: contentContainerView.leadingAnchor),
            diasesName.bottomAnchor.constraint(equalTo: contentContainerView.bottomAnchor),
            diasesName.trailingAnchor.constraint(equalTo: contentContainerView.trailingAnchor),
            diasesName.topAnchor.constraint(equalTo: diasesImage.bottomAnchor , constant: 5.autoSized),
        ])
        
    }
    
    
    func populateData(diasesAlbum : AllData.Data){
        if let image = diasesAlbum.image {
            let imageURL = String(format: url.albumImageUrl, image)
        diasesImage.downloadImage(url: imageURL)
        }
        diasesName.text = diasesAlbum.name
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
