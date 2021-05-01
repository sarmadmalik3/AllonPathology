//
//  SideMenuCell.swift
//  Allon Pathology
//
//  Created by Sarmad Malik on 01/05/2021.
//

import UIKit

class SideMenuCell: UITableViewCell {

    let menuImage = ImageView(imageName: "introduction")
    let menuTitle = Label(text: "Introduction", textColor: #colorLiteral(red: 0.5450980392, green: 0.3803921569, blue: 0.5607843137, alpha: 1), font: .setFont(fontName: .Poppins_Regular, fontSize: 16), alingment: .left)
    let containerView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        view.layer.cornerRadius = 10.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        addSubview(containerView)
        containerView.addSubview(menuImage)
        containerView.addSubview(menuTitle)
        
        NSLayoutConstraint.activate([
        
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor ,constant: -30.widthRatio),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 10.heightRatio),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.heightRatio),
            
            menuImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20.widthRatio),
            menuImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
//            menuImage.widthAnchor.constraint(equalToConstant: 20.widthRatio),
//            menuImage.heightAnchor.constraint(equalToConstant: 15.heightRatio),
            
            menuTitle.leadingAnchor.constraint(equalTo: menuImage.trailingAnchor, constant: 19.widthRatio),
            menuTitle.centerYAnchor.constraint(equalTo: menuImage.centerYAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func selectedCell(){
        menuTitle.textColor = .white
        menuImage.tintColor = UIColor.white
        containerView.backgroundColor = #colorLiteral(red: 0.1176470588, green: 0.3764705882, blue: 0.5960784314, alpha: 1)
    }
    func unselectedCell(){
        menuTitle.textColor = #colorLiteral(red: 0.5450980392, green: 0.3803921569, blue: 0.5607843137, alpha: 1)
        menuImage.tintColor = #colorLiteral(red: 0.5450980392, green: 0.3803921569, blue: 0.5607843137, alpha: 1)
        containerView.backgroundColor = .clear
    }
}
