//
//  EntryViewController.swift
//  SeSAC_Assignment_0103
//
//  Created by 이중엽 on 1/4/24.
//

import UIKit

class EntryViewController: UIViewController {
    @IBOutlet var nicknameLabel: UILabel!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var saveButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        guard let nickname = UserDefaults.standard.string(forKey: Constant.KEY.LASTNICKNAME) else { return }
        nicknameTextField.text = nickname
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designUI()
        
        if let nickname = UserDefaults.standard.string(forKey: Constant.KEY.LASTNICKNAME) {
            nicknameTextField.text = nickname
            isButtonEnabled(saveButton, text: nickname)
        }
    }
    
    //https://velog.io/@ellyheetov/errorhandling01
    override func viewDidAppear(_ animated: Bool) {
        //자동 로그인
        let isLogin = UserDefaults.standard.bool(forKey: Constant.KEY.AUTOLOGIN)
        if isLogin { nextButtonClicked(saveButton) }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func designUI() {
        self.view.backgroundColor = .white
        
        nicknameLabel.designLabel(message: "닉네임을 입력해주세요.", fontType: .REGULAR, fontSize: 14)
        
        nicknameTextField.designTexField(placeholder: "최소 2글자", keyboardType: .default)
        
        saveButton.setTitle("다음", for: .normal)
        saveButton.backgroundColor = .systemYellow
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.setTitleColor(.lightGray, for: .disabled)
        saveButton.setTitleColor(.darkGray, for: .highlighted)
        saveButton.layer.cornerRadius = 10
        saveButton.isEnabled = false
    }
    
    @discardableResult
    func isButtonEnabled(_ button: UIButton, text: String) -> Bool {
        let result = text.count > 2 ? true : false
        button.isEnabled = result
        return result
    }
    
    @IBAction func userInputDetected(_ sender: UITextField) {
        guard let text = sender.text else { return }
        if isButtonEnabled(saveButton, text: text) {
            UserDefaults.standard.setValue(text, forKey: Constant.KEY.LASTNICKNAME)
        }
    }
    
    @IBAction func nextButtonClicked(_ sender: UIButton) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: Constant.IDENTIFIER.mainVC) else { return}
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true) {
            UserDefaults.standard.setValue(true, forKey: Constant.KEY.AUTOLOGIN)
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITextField) {
    }
}
