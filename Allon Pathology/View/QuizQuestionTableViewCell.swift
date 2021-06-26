//
//  QuizQuestionTableViewCell.swift
//  Allon Pathology
//
//  Created by Sarmad Ishfaq on 26/06/2021.
//

import UIKit

class QuizQuestionTableViewCell: UITableViewCell {

    //MARK:-UI-Elements
    let question = Label(text: "What do you like most about being a (YOUR SPECIALTY)? What do you like least about being a (YOUR SPECIALTY)? What was the best or worst experience in your residency training? What would you consider your most difficult case, and how did you handle it?", textColor: .black, font: .setFont(fontName: .Poppins_SemiBold, fontSize: 14), alingment: .left)
    
    //MARK:-Cell Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(question)
        NSLayoutConstraint.activate([
        
            question.topAnchor.constraint(equalTo: topAnchor, constant: 10.heightRatio),
            question.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20.heightRatio),
            question.leadingAnchor.constraint(equalTo: leadingAnchor),
            question.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
