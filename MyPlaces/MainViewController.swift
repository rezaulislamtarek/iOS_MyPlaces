//
//  ViewController.swift
//  MyPlaces
//
//  Created by Rezaul Islam on 23/2/23.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    lazy var lblName: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.text = "Enter your name"
        l.font = UIFont.systemFont(ofSize: 20)
        return l
    }()
    
    lazy var tfName : UITextField = {
        let t = UITextField()
        t.placeholder = "Rezaul Islam"
        t.font = UIFont.systemFont(ofSize: 20)
        t.textColor = .black
        t.backgroundColor = hexStringToUIColor(hex: "efefef")
        t.borderStyle = .roundedRect
        t.layer.cornerRadius = 10
        t.resignFirstResponder()
        return t
    }()
    
    lazy var btnContinue : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Continue", for: .normal)
        btn.backgroundColor = .green
        btn.tintColor = .white
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(btnTapOnContinue), for: .touchUpInside)
        
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setUpView()
    }
    
    func setUpView() {
        view.addSubview(lblName)
        view.addSubview(tfName)
        view.addSubview(btnContinue)
        
        setConstraints()
    }
    
    func setConstraints(){
        lblName.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        tfName.snp.makeConstraints{make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(lblName.snp.bottom).offset(8)
            make.height.equalTo(50)
        }
        
        btnContinue.snp.makeConstraints{make in
            make.height.equalTo(50)
            make.top.equalTo(tfName.snp.bottom).offset(16)
            make.leading.trailing.equalTo(tfName)
        }
    }
    
    @objc func btnTapOnContinue(){
        let vc = PlacesViewController()
        vc.data = tfName.text
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        navigationController?.popViewController(animated: true)
        
        navigationController?.pushViewController(vc, animated: true)
    }


}

