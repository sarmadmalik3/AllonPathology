//
//  ViewController.swift
//  Allon Pathology
//
//  Created by Malik Farhan Asim on 26/04/2021.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- UI-Elements
    let albumsLabel = Label(text: "Diagnoses Albums", textColor: #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1), font: .setFont(fontName: .Poppins_SemiBold , fontSize: 20), alingment: .natural)
    let line : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let searchTextField : UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        tf.layer.cornerRadius = 5.widthRatio
        tf.font = .setFont(fontName: .Poppins_Light, fontSize: 12.heightRatio)
        tf.leftViewMode = .always
        tf.textColor = #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
        tf.tintColor = #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
        tf.attributedPlaceholder = NSAttributedString(string: "Search diagnoses albums ..",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        let image = UIImage(named: "search")
        let leftView = UIView()
        let leftImageView = UIImageView()
        leftImageView.contentMode = .scaleAspectFit
        leftImageView.image = image
        leftView.frame = CGRect(x: 0, y: 0, width: 45.widthRatio, height: 15.heightRatio)
        leftImageView.frame = CGRect(x: 20.widthRatio, y: 0, width: 15.widthRatio, height: 15.heightRatio)
        tf.leftViewMode = .always
        tf.leftView = leftView
        leftView.addSubview(leftImageView)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    
    //MARK:- ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        setupViews()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    //MARK:- Constraints
    func setupViews(){
        let navView = view.insertNavbarView()
        view.addSubview(albumsLabel)
        view.addSubview(line)
        view.addSubview(searchTextField)
        NSLayoutConstraint.activate([
            albumsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.widthRatio),
            albumsLabel.topAnchor.constraint(equalTo: navView.bottomAnchor, constant: 50.heightRatio),
            
            line.heightAnchor.constraint(equalToConstant: 1),
            line.widthAnchor.constraint(equalToConstant: 55.widthRatio),
            line.centerYAnchor.constraint(equalTo: albumsLabel.centerYAnchor),
            line.leadingAnchor.constraint(equalTo: albumsLabel.trailingAnchor, constant: 10.widthRatio),
            
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.widthRatio),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30.widthRatio),
            searchTextField.heightAnchor.constraint(equalToConstant: 42.heightRatio),
            searchTextField.topAnchor.constraint(equalTo: albumsLabel.bottomAnchor, constant: 15.heightRatio),
        ])
    }

}

