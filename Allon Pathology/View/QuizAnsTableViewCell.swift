//
//  QuizAnsTableViewCell.swift
//  Allon Pathology
//
//  Created by Sarmad Ishfaq on 26/06/2021.
//

import UIKit

class QuizAnsTableViewCell: UITableViewCell {

    //MARK:- UI-Elements
    let answer = Label(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut ", textColor: .lightGray, font: .setFont(fontName: .Poppins_Medium, fontSize: 13), alingment: .left)
    lazy var radioButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "selectedRadio"), for: .selected)
        button.setImage(UIImage(named: "unSelectedRadio"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    //MARK:-Cell Method
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        radioButton.addTarget(self, action: #selector(radioButtonTapped), for: .touchUpInside)
        backgroundColor = .clear
        selectionStyle = .none
        radioButton.isSelected = false
        addSubview(radioButton)
        addSubview(answer)
        
        
        NSLayoutConstraint.activate([
        
            answer.leadingAnchor.constraint(equalTo: leadingAnchor),
            answer.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -30.widthRatio),
            answer.topAnchor.constraint(equalTo: topAnchor, constant: 20.heightRatio),
            answer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20.heightRatio),
            
            radioButton.widthAnchor.constraint(equalToConstant: 20),
            radioButton.heightAnchor.constraint(equalToConstant: 20),
            radioButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            radioButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func radioButtonTapped(){
        radioButton.isSelected = !radioButton.isSelected
    }
}
