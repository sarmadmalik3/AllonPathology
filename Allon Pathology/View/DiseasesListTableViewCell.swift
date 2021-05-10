//
//  DiseasesListTableViewCell.swift
//  Allon Pathology
//
//  Created by Sarmad Ishfaq on 10/05/2021.
//

import UIKit

class DiseasesListTableViewCell: UITableViewCell {

    let diasesName = Label(text: "Lorem ipsum dolor sit amet, consetetur sadi elitr . (21 images)", textColor: colors.appBlue, font: .setFont(fontName: .Poppins_Regular, fontSize: 13), alingment: .natural)
    
    let dotView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5450980392, green: 0.3803921569, blue: 0.5607843137, alpha: 1)
        view.layer.cornerRadius = 4.widthRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let containerView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 11.widthRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let lineView : UIView = {
        let view = UIView()
        view.backgroundColor =  #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        addSubview(containerView)
        containerView.addSubview(dotView)
        containerView.addSubview(diasesName)
        addSubview(lineView)
        
        NSLayoutConstraint.activate([
        
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30.widthRatio),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 8.heightRatio),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8.heightRatio),
            
            dotView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 14.widthRatio),
            dotView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            dotView.widthAnchor.constraint(equalToConstant: 8.widthRatio),
            dotView.heightAnchor.constraint(equalTo: dotView.widthAnchor),
            
            diasesName.leadingAnchor.constraint(equalTo: dotView.trailingAnchor, constant: 16.widthRatio),
            diasesName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10.widthRatio),
            diasesName.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            lineView.leadingAnchor.constraint(equalTo: dotView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: diasesName.trailingAnchor),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1),
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
