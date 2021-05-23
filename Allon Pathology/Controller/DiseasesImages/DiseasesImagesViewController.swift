//
//  DiseasesImagesViewController.swift
//  Allon Pathology
//
//  Created by Sarmad Ishfaq on 10/05/2021.
//

import UIKit

class DiseasesImagesViewController: ParentController {

    //MARK:-UI-Elements
    lazy var collectionView :UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .clear
        collection.showsVerticalScrollIndicator = false
        layout.estimatedItemSize = .zero
        collection.register(DiseasesImagesCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        return collection
    }()
    
    //MARK:-Properties
    let cellId = "cellId"
    var diseaseDetail = [DiseaseDetail.Data]()
    var diseaseId : Int = 0
    //MARK:-ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        humburger.image = UIImage(named: "arrow_back")
        getDiseaseDetail()
    }

    override func setupViews() {
        super.setupViews()
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: navbg_image.bottomAnchor, constant: 20.autoSized),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33.widthRatio),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -33.widthRatio),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
    //MARK:-Helper Methods
    override func handleHumbuger() {
        navigationController?.popViewController(animated: true)
    }
    
}
extension DiseasesImagesViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return diseaseDetail.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DiseasesImagesCollectionViewCell
        let row = diseaseDetail[indexPath.row].image
        if let imageUrl = row {
            cell.diasesImage.downloadImage(url: String(format: url.diseaseImage, imageUrl))
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = DiseasesDetailViewController()
        let cell = collectionView.cellForItem(at: indexPath) as! DiseasesImagesCollectionViewCell
        controller.diseasesImage.image = cell.diasesImage.image
        controller.textView.text = diseaseDetail[indexPath.row].description
        navigationController?.pushViewController(controller, animated: true)
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

extension DiseasesImagesViewController {
    func getDiseaseDetail(){
        showProgressHud()
        ApiFactory.sharedInstance.getDiseaseDetail(diseaseId: diseaseId) { [weak self] (DiseaseDetail) in
            self?.dissmissProgressHud()
            if let detail = DiseaseDetail {
                self?.diseaseDetail = detail.data ?? []
                self?.collectionView.reloadData()
            }
        }
    }
}
