//
//  QuizMeController.swift
//  Allon Pathology
//
//  Created by Sarmad Ishfaq on 26/06/2021.
//

import UIKit

class QuizMeController: ParentController {
    
    //MARK:-UI-Elements
    let quizLabel = Label(text: "Quiz", textColor: #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1), font: .setFont(fontName: .Poppins_SemiBold , fontSize: 20), alingment: .natural)
    let questionNo = Label(text: "Question #4 Outof 10", textColor: .black, font: .setFont(fontName: .Poppins_Medium, fontSize: 14), alingment: .center)
    let line : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var tableView : UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .white
        tv.register(QuizQuestionTableViewCell.self, forCellReuseIdentifier: questionCell)
        tv.register(QuizAnsTableViewCell.self, forCellReuseIdentifier: ansCell)
        tv.tableFooterView = UIView()
        tv.showsVerticalScrollIndicator = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    let backButton = Button(text: "Back", textColor: .white, font: .setFont(fontName: .Poppins_SemiBold, fontSize: 13), cornerRadious: 5, bgColor: colors.appBlue)
    let nextButton = Button(text: "Next", textColor: .white, font: .setFont(fontName: .Poppins_SemiBold, fontSize: 13), cornerRadious: 5, bgColor: colors.appBlue)
    
    //MARK:-Properties
    let questionCell = "QuesionCell"
    let ansCell = "AnswerCell"
    var selectedIndex : Int!
    var isNextButton : Bool = false
    var isbackButton : Bool = false
    var isRefresh : Bool = true
    
    //MARK:-ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
    }
    
    
    override func setupViews() {
        super.setupViews()
        view.addSubview(line)
        view.addSubview(quizLabel)
        view.addSubview(questionNo)
        view.addSubview(tableView)
        view.addSubview(backButton)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            
            quizLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.widthRatio),
            quizLabel.topAnchor.constraint(equalTo: navbg_image.bottomAnchor, constant: -20.heightRatio),
            
            line.heightAnchor.constraint(equalToConstant: 1),
            line.widthAnchor.constraint(equalToConstant: 30.widthRatio),
            line.centerYAnchor.constraint(equalTo: quizLabel.centerYAnchor),
            line.leadingAnchor.constraint(equalTo: quizLabel.trailingAnchor, constant: 10.widthRatio),
            
            questionNo.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            questionNo.bottomAnchor.constraint(equalTo: tableView.topAnchor , constant: -10.heightRatio),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 25.widthRatio),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25.widthRatio),
            tableView.topAnchor.constraint(equalTo: quizLabel.bottomAnchor,constant: 25.widthRatio),
            tableView.bottomAnchor.constraint(equalTo: nextButton.topAnchor,constant: -10.widthRatio),
            
            
            backButton.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10.heightRatio),
            backButton.widthAnchor.constraint(equalToConstant: 100.widthRatio),
            backButton.heightAnchor.constraint(equalToConstant: 40.heightRatio),
            
            nextButton.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10.heightRatio),
            nextButton.widthAnchor.constraint(equalToConstant: 100.widthRatio),
            nextButton.heightAnchor.constraint(equalToConstant: 40.heightRatio),
        ])
    }
    
    //MARK:-Selector
    
    @objc func backButtonPressed(){
        isRefresh = false
        isNextButton = false
        isbackButton = true
        tableView.reloadData()
    }
    @objc func nextButtonPressed(){
        isRefresh = false
        isNextButton = true
        isbackButton = false
        tableView.reloadData()
    }
    
}
extension QuizMeController : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 4
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
             let cell = tableView.dequeueReusableCell(withIdentifier: questionCell) as! QuizQuestionTableViewCell
                return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: ansCell) as! QuizAnsTableViewCell
            if selectedIndex != nil {
                if selectedIndex == indexPath.row {
                    cell.radioButton.isSelected = true
                }else{
                    cell.radioButton.isSelected = false
                }
            }
            
               return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            isRefresh = false
            isNextButton = false
            isbackButton = false
            selectedIndex = indexPath.row
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if isRefresh {
            
            let animation = AnimationFactory.makeSlideIn(duration: 0.5, delayFactor: 0.05)
            let animator = Animator(animation: animation)
            animator.animate(cell: cell, at: indexPath, in: tableView)
        }
        
        if isNextButton {
            
            let animation = AnimationFactory.makeSlideIn(duration: 0.5, delayFactor: 0.05)
            let animator = Animator(animation: animation)
            animator.animate(cell: cell, at: indexPath, in: tableView)
        }
        if isbackButton {

            let animation = AnimationFactory.makeSlideOut(duration: 0.5, delayFactor: 0.05)
            let animator = Animator(animation: animation)
            animator.animate(cell: cell, at: indexPath, in: tableView)
        }
        
        
    }
}
