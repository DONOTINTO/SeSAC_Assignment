//
//  SignUpViewController.swift
//  SeSAC12.26_SB_HW
//
//  Created by 이중엽 on 12/27/23.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var recommendCodeTextField: UITextField!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var extraInfoSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    @IBAction func tapGestureRecognizerClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func signUpButtonClicked(_ sender: UIButton) {
        if emailTextField.text == "" {
            emailTextField.becomeFirstResponder()
            return
        }
        
        if passwordTextField.text == "" || passwordTextField.text!.count <= 6 {
            passwordTextField.becomeFirstResponder()
            return
        }
    }
    
    @IBAction func switchClicked(_ sender: UISwitch) {
        if !sender.isOn {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                self.nicknameTextField.alpha = 0
                self.locationTextField.alpha = 0
                self.recommendCodeTextField.alpha = 0
                self.signUpButton.transform = CGAffineTransform(translationX: 0, y: -134)
                self.infoLabel.transform = CGAffineTransform(translationX: 0, y: -134)
                self.extraInfoSwitch.transform = CGAffineTransform(translationX: 0, y: -134)
            },completion: { _ in
                UIView.animate(withDuration: 0.2, animations: {
                    self.nicknameTextField.isHidden = !sender.isOn
                    self.locationTextField.isHidden = !sender.isOn
                    self.recommendCodeTextField.isHidden = !sender.isOn
                })
            })
        } else {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                self.nicknameTextField.isHidden = !sender.isOn
                self.locationTextField.isHidden = !sender.isOn
                self.recommendCodeTextField.isHidden = !sender.isOn
                self.nicknameTextField.alpha = 0.5
                self.locationTextField.alpha = 0.5
                self.recommendCodeTextField.alpha = 0.5
                self.signUpButton.transform = CGAffineTransform(translationX: 0, y: 0)
                self.infoLabel.transform = CGAffineTransform(translationX: 0, y: 0)
                self.extraInfoSwitch.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: { _ in
                UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: {
                    self.nicknameTextField.alpha = 1
                    self.locationTextField.alpha = 1
                    self.recommendCodeTextField.alpha = 1
                })
            })
        }
    }
    
    func makeUI() {
        self.view.backgroundColor = .black
        
        let logo = UIImage(named: "wordmark")
        logoImageView.image = logo
        logoImageView.contentMode = .scaleAspectFit
        
        setTextField(emailTextField, title: "이메일 주소 또는 전화번호")
        setTextField(passwordTextField, title: "비밀번호")
        setTextField(nicknameTextField, title: "닉네임")
        setTextField(locationTextField, title: "위치")
        setTextField(recommendCodeTextField, title: "추천인 코드")
        
        emailTextField.keyboardType = .emailAddress
        passwordTextField.isSecureTextEntry = true
        recommendCodeTextField.keyboardType = .numberPad
        
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.backgroundColor = .white
        signUpButton.layer.cornerRadius = 10
        signUpButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        signUpButton.titleLabel?.textAlignment = .center
        
        infoLabel.text = "추가 정보 입력"
        infoLabel.textColor = .white
        
        extraInfoSwitch.setOn(true, animated: true)
        extraInfoSwitch.thumbTintColor = .white
        extraInfoSwitch.onTintColor = .systemGreen
        extraInfoSwitch.backgroundColor = .lightGray
        extraInfoSwitch.layer.cornerRadius = extraInfoSwitch.frame.height / 2.0
    }
    
    func setTextField(_ textField: UITextField, title: String) {
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .darkGray
        textField.placeholder = title
        textField.textAlignment = .center
        textField.textColor = .white
        
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder!, attributes: [.foregroundColor: UIColor.white.cgColor])
        textField.returnKeyType = .done
    }
}
