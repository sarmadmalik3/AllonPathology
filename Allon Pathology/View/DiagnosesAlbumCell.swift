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
    let diasesImage = ImageView(imageName: "")
    let diasesName = Label(text: "", textColor: .white, font: .setFont(fontName: .Poppins_Medium, fontSize: 18), alingment: .natural)
    let imageCountLabel = Label(text: "52 Images", textColor: .white, font: .setFont(fontName: .Poppins_Regular, fontSize: 10), alingment: .natural)
    let lineView : UIView = {
        let line = UIView()
        line.backgroundColor = .white
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    let dotView : UIView = {
        let line = UIView()
        line.backgroundColor = .white
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(containerView)
        containerView.addSubview(diasesImage)
        containerView.addSubview(diasesName)
        containerView.addSubview(imageCountLabel)
        containerView.addSubview(lineView)
        containerView.addSubview(dotView)
        imageCountLabel.alpha = 0.8
        lineView.alpha = 0.8
        dotView.alpha = 0.8
        self.clipsToBounds = false
        self.applyShadow()
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            diasesImage.widthAnchor.constraint(equalToConstant: 55.widthRatio),
            diasesImage.heightAnchor.constraint(equalTo: diasesImage.widthAnchor),
            diasesImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            diasesImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 23.heightRatio),
            
            diasesName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15.widthRatio),
            diasesName.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -41.heightRatio),
            diasesName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15.widthRatio),
            
            imageCountLabel.leadingAnchor.constraint(equalTo: diasesName.leadingAnchor),
            imageCountLabel.bottomAnchor.constraint(equalTo: lineView.topAnchor, constant: -6.heightRatio),
            
            lineView.leadingAnchor.constraint(equalTo: diasesName.leadingAnchor),
            lineView.widthAnchor.constraint(equalToConstant: 53.widthRatio),
            lineView.heightAnchor.constraint(equalToConstant: 2.heightRatio),
            lineView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -18.heightRatio),
            
            dotView.leadingAnchor.constraint(equalTo: lineView.trailingAnchor, constant: 2.widthRatio),
            dotView.widthAnchor.constraint(equalToConstant: 3.widthRatio),
            dotView.heightAnchor.constraint(equalToConstant: 2.heightRatio),
            dotView.centerYAnchor.constraint(equalTo: lineView.centerYAnchor),
        ])
        
    }
    
    
    func populateData(diasesAlbum : DiagnosesAlbum){
        diasesImage.image = UIImage(named: diasesAlbum.image)
        diasesName.text = diasesAlbum.name
        diasesName.setLineSpacing(lineSpacing: 0.5, lineHeightMultiple: 0.8 )
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
