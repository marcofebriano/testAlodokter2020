//
//  ViewController.swift
//  testAlodokter
//
//  Created by Marco Ramadhani (ID) on 02/07/20.
//  Copyright © 2020 MarcoFRVinkoert. All rights reserved.
//

import UIKit
import SnapKit

protocol SignPageViewProtocol: class {
    func failedLogin(message: String)
    func successLogin(message: String)
}

open class ViewController: UIViewController {

    public lazy var container: UIView = .init()
    public lazy var usernameTxt: UITextField = .init()
    public lazy var passwordTxt: UITextField = .init()
    public lazy var button: UIButton = .init()
    public lazy var titleView: UILabel = .init()
    
    private var presenter: SignPagePresenterProtocol?
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        presenter = SignPagePresenter(view: self)
        setLayout()
        setView()
    }
    
    @objc func buttonTapped() {
        self.becomeFirstResponder()
        let username = usernameTxt.text ?? ""
        let password = passwordTxt.text ?? ""
        if !username.isEmpty && !password.isEmpty {
            presenter?.doLogin(username: username, password: password)
        } else {
            showAlert(message: "cek kembali data yang anda masukkan!")
        }
    }
}

// MARK: set Views
extension ViewController {
    private func setLayout() {
        self.view.addSubview(container)
        self.view.addSubview(titleView)
        self.container.addSubview(usernameTxt)
        self.container.addSubview(passwordTxt)
        self.container.addSubview(button)
        
        titleView.snp.makeConstraints {
            $0.top.equalTo(self.view.snp.topMargin).offset(30)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().inset(16)
            $0.centerX.equalToSuperview()
        }
        
        container.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().inset(16)
        }
        
        usernameTxt.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
        
        passwordTxt.snp.makeConstraints {
            $0.top.equalTo(usernameTxt.snp.bottom).offset(16)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
        button.snp.makeConstraints {
            $0.top.equalTo(passwordTxt.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
    }
    
    private func setView() {
        self.view.backgroundColor = .white
        tapViewToDismissKeyboard()
        container.backgroundColor = .clear
        setButton()
        setTitleLabel()
        setTextfield()
    }
    private func setTitleLabel() {
        titleView.text = "Login"
        titleView.font = UIFont.boldSystemFont(ofSize: 25)
        titleView.textColor = #colorLiteral(red: 0.2078431373, green: 0.4392156863, blue: 0.8235294118, alpha: 1)
        titleView.textAlignment = .center
    }
    private func setButton() {
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 8
        button.setTitle("Masuk", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2078431373, green: 0.4392156863, blue: 0.8235294118, alpha: 1)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    private func setTextfield() {
        usernameTxt.placeholder = "Username: Admin"
        usernameTxt.borderStyle = .roundedRect
        passwordTxt.placeholder = "Password: Admin"
        passwordTxt.borderStyle = .roundedRect
    }
}

extension ViewController: SignPageViewProtocol {
    func failedLogin(message: String) {
        showAlert(message: message)
    }
    
    func successLogin(message: String) {
        showAlert(message: message) {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
