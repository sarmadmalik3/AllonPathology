//
//  ViewController.swift
//  Allon Pathology
//
//  Created by Malik Farhan Asim on 26/04/2021.
//

import UIKit

class DashboardController: ParentController  {

    //MARK:- UI-Elements
    let albumsLabel = Label(text: "Diagnoses Albums", textColor: #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1), font: .setFont(fontName: .Poppins_SemiBold , fontSize: 20), alingment: .natural)
    let line : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var searchTextField : UITextField = {
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
        tf.delegate = self
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    let cellId = "cellId"
    lazy var collectionView :UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .clear
        collection.showsVerticalScrollIndicator = false
        collection.register(DiagnosesAlbumCell.self, forCellWithReuseIdentifier: cellId)
        return collection
    }()
    
    //MARK:-Properties
    var diagnosesAlbum : AllData!
    var allData : [AllData.Data]!
    
    var filteredData : [AllData.Data]!
    
    //MARK:- ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        SideMenu.selectedIndex = 1
        getDiagnosesList()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    //MARK:- Constraints
    override func setupViews(){
        super.setupViews()
        
        view.addSubview(albumsLabel)
        view.addSubview(line)
        view.addSubview(searchTextField)
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            albumsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.widthRatio),
            albumsLabel.topAnchor.constraint(equalTo: navbg_image.bottomAnchor, constant: -20.autoSized),
            
            line.heightAnchor.constraint(equalToConstant: 1),
            line.widthAnchor.constraint(equalToConstant: 55.autoSized),
            line.centerYAnchor.constraint(equalTo: albumsLabel.centerYAnchor),
            line.leadingAnchor.constraint(equalTo: albumsLabel.trailingAnchor, constant: 10.autoSized),
            
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.widthRatio),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30.widthRatio),
            searchTextField.heightAnchor.constraint(equalToConstant: 42.autoSized),
            searchTextField.topAnchor.constraint(equalTo: albumsLabel.bottomAnchor, constant: 15.autoSized),
            
            collectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20.autoSized),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33.widthRatio),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -33.widthRatio),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
        ])
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text, let textRange = Range(range, in: text) {
         let updatedText = text.replacingCharacters(in: textRange,with: string)
            if !updatedText.isEmpty {
                filteredData = allData.filter({ (data) -> Bool in
                    return data.name!.lowercased().contains(updatedText.lowercased())
                })
            }else {
                filteredData = allData
            }
            collectionView.reloadData()
        }
        return true
    }
    
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

extension DashboardController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if diagnosesAlbum != nil {
            return filteredData.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DiagnosesAlbumCell
        cell.populateData(diasesAlbum: filteredData[indexPath.row])

        if !cell.isAnimated {
            UIView.animate(withDuration: 0.5, delay: 0.5 * Double(indexPath.row), usingSpringWithDamping: 0.4, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
                AnimationUtility.viewSlideInFromBottom(toTop: cell)
                
            }, completion: { (done) in
                cell.isAnimated = true
            })
        }
//
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = filteredData[indexPath.row]
        let controller = DiaseaAlbumViewController()
        controller.diasesAlbumArray = filteredData[indexPath.row].diseasealbums ?? []
        controller.albumsLabel.text = row.name
        controller.searchBarPlaceHolder = NSAttributedString(string: String(format: "Search %@ ...", row.name ?? ""))
//        controller.searchTextField.attributedPlaceholder = NSAttributedString(string: String(format: "Search %@ ...", row.name ?? ""))
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = 308.widthRatio
        let spacing = 9.widthRatio
        let totalWidth = collectionViewWidth - spacing
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            let collectionViewWidth = 307.widthRatio
            let spacing = 9.widthRatio
            let totalWidth = collectionViewWidth - spacing
            return CGSize(width: totalWidth / 3, height: 165.autoSized)
        }
        
        return CGSize(width: totalWidth / 2, height: 165.autoSized)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 9.autoSized
    }
}

extension DashboardController {
    
    func getDiagnosesList(){
        showProgressHud()
        ApiFactory.sharedInstance.getAllData { [weak self] (DiagnosesAlbum) in
            self?.dissmissProgressHud()
            if let diagnosesAlbum = DiagnosesAlbum {
                self?.diagnosesAlbum = diagnosesAlbum
                self?.filteredData = diagnosesAlbum.data
                self?.allData = diagnosesAlbum.data
                if self?.diagnosesAlbum.data.count == 0 {
                    self?.noDataFoundLabel.alpha = 1
                }else{
                    self?.noDataFoundLabel.alpha = 0
                }
                self?.collectionView.reloadData()
            }
        }
    }
}
