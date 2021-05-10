//
//  DiagnosesAlbumCell.swift
//  Allon Pathology
//
//  Created by Sarmad Malik on 28/04/2021.
//

import UIKit

class DiagnosesAlbumCell: UICollectionViewCell {
    
    let containerView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.7803921569, green: 0.4784313725, blue: 0.8156862745, alpha: 1)
        view.layer.cornerRadius = 10.widthRatio
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
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(containerView)
        containerView.addSubview(contentContainerView)
        contentContainerView.addSubview(diasesImage)
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
            contentContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor , constant: 5.widthRatio),
            contentContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor , constant: -5.widthRatio),
            
            diasesImage.widthAnchor.constraint(equalToConstant: 55.widthRatio),
            diasesImage.heightAnchor.constraint(equalTo: diasesImage.widthAnchor),
            diasesImage.topAnchor.constraint(equalTo: contentContainerView.topAnchor),
            diasesImage.centerXAnchor.constraint(equalTo: contentContainerView.centerXAnchor),
            
            diasesName.leadingAnchor.constraint(equalTo: contentContainerView.leadingAnchor),
            diasesName.bottomAnchor.constraint(equalTo: contentContainerView.bottomAnchor),
            diasesName.trailingAnchor.constraint(equalTo: contentContainerView.trailingAnchor),
            diasesName.topAnchor.constraint(equalTo: diasesImage.bottomAnchor , constant: 5.heightRatio),
        ])
        
    }
    
    
    func populateData(diasesAlbum : DiagnosesAlbum){
        diasesImage.image = UIImage(named: diasesAlbum.image)
        diasesName.text = diasesAlbum.name
//        diasesName.setLineSpacing(lineSpacing: 0.5, lineHeightMultiple: 0.8 )
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
