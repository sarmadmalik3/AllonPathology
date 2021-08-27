//
//  DiseasesListViewController.swift
//  Allon Pathology
//
//  Created by Sarmad Ishfaq on 10/05/2021.
//

import UIKit

class DiseasesListViewController: ParentController {

    //MARK:-UI-Elements
    let albumsLabel = Label(text: "Diagnoses Albums", textColor: #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1), font: .setFont(fontName: .Poppins_SemiBold , fontSize: 20), alingment: .natural)
   lazy var searchTextField : UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        tf.layer.cornerRadius = 5.widthRatio
        tf.font = .setFont(fontName: .Poppins_Light, fontSize: 12.heightRatio)
        tf.leftViewMode = .always
        tf.textColor = #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
        tf.tintColor = #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
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
        tf.delegate = self
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    let line : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(DiseasesListTableViewCell.self, forCellReuseIdentifier: diseasesCellId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    //MARK:-Properties
    let diseasesCellId = "diseasesCellId"
    var diseaseListArray = [AllData.Disease_list]()
    //MARK:-ViewController lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        humburger.image = UIImage(named: "arrow_back")
        if diseaseListArray.count == 0 {
            noDataFoundLabel.alpha = 1
        }else{
            noDataFoundLabel.alpha = 0
        }
    }

    override func setupViews() {
        super.setupViews()
        view.addSubview(line)
        view.addSubview(albumsLabel)
        view.addSubview(searchTextField)
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
        
            albumsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.widthRatio),
            albumsLabel.topAnchor.constraint(equalTo: navbg_image.bottomAnchor, constant: -20.heightRatio),

            line.heightAnchor.constraint(equalToConstant: 1),
            line.widthAnchor.constraint(equalToConstant: 55.widthRatio),
            line.centerYAnchor.constraint(equalTo: albumsLabel.centerYAnchor),
            line.leadingAnchor.constraint(equalTo: albumsLabel.trailingAnchor, constant: 10.widthRatio),
            
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.widthRatio),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30.widthRatio),
            searchTextField.heightAnchor.constraint(equalToConstant: 42.heightRatio),
            searchTextField.topAnchor.constraint(equalTo: albumsLabel.bottomAnchor, constant: 15.heightRatio),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 30.heightRatio),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    override func handleHumbuger() {
        navigationController?.popViewController(animated: true)
    }
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    

}
extension DiseasesListViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diseaseListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: diseasesCellId) as! DiseasesListTableViewCell
        cell.diasesName.text = diseaseListArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DiseasesImagesViewController()
        controller.diseaseDetailArray = diseaseListArray[indexPath.row].disease_detail ?? []
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.heightRatio
    }
    
}
