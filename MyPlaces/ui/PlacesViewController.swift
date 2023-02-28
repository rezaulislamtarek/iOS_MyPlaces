//
//  PlacesViewController.swift
//  MyPlaces
//
//  Created by Rezaul Islam on 23/2/23.
//

import UIKit
import SnapKit
import SwiftUI

class PlacesViewController: UIViewController {
    
    var data: String?
    
    lazy var lblName : UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.font = UIFont.systemFont(ofSize: 20)
        return l
    }()
    
    lazy var placeSelectionView : PlaceSelectionView = {
        let psV = PlaceSelectionView{[weak self] place in
            self?.lblName.text = place
        }
        return psV
    }()
    
    lazy var hostingController : UIHostingController = {
        let hc = UIHostingController(rootView: placeSelectionView)
        return hc
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
        
        if let data = data{
            print(data)
            lblName.text = "Hello \(data)"
        }
    }
    
    func setUpView(){
        view.addSubview(lblName)
        view.addSubview(hostingController.view)
        
        setUpContraint()
    }
    
    func setUpContraint(){
        lblName.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(100)	
            make.leading.equalToSuperview().inset(16)
        }
        hostingController.view.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }

}
