//
//  ViewController.swift
//  SeSAC_Assignment_0103
//
//  Created by 이중엽 on 1/3/24.
//
import UIKit

enum FontType {
    case BOLD
    case REGULAR
}

enum BMIType: String {
    case UNDERWEIGHT = "저체중"
    case NORMALWEIGHT = "정상체중"
    case OVERWEIGHT = "과체중"
    case HEAVYWEIGHT = "비만"
}

class ViewController: UIViewController {
    @IBOutlet var mainView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var randomLabel: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var secureButton: UIButton!
    @IBOutlet var resultButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designUI()
        
        heightTextField.tag = 0
        weightTextField.tag = 1
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(randomClicked(_:)))
        randomLabel.isUserInteractionEnabled = true
        randomLabel.addGestureRecognizer(tapGesture)
        
        let mainViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(viewDismissKeyboard(_:)))
        mainView.isUserInteractionEnabled = true
        mainView.addGestureRecognizer(mainViewTapGesture)
    }
    
    func setTextFieldText(_ textField: UITextField, text: String) {
        textField.text = text
        changeResultButtonState(heightTextField, weightTextField)
    }
    
    func designUI() {
        guard let nickname = UserDefaults.standard.string(forKey: Constant.KEY.LASTNICKNAME) else { return }
        
        let height = UserDefaults.standard.string(forKey: Constant.KEY.LASTHEIGHT)
        let weight = UserDefaults.standard.string(forKey: Constant.KEY.LASTWEIGHT)
        
        resultButton.isEnabled = false
        
        mainView.backgroundColor = .white
        
        titleLabel.designLabel(message: "BMI Calculator", fontType: .BOLD, fontSize: 30)
        subtitleLabel.designLabel(message: "\(nickname)님의 BMI 지수를 \n알려드릴게요", fontType: .REGULAR, fontSize: 16, line: 2)
        heightLabel.designLabel(message: "키가 어떻게 되시나요?", fontType: .REGULAR, fontSize: 14)
        weightLabel.designLabel(message: "몸무게가 어떻게 되시나요?", fontType: .REGULAR, fontSize: 14)
        randomLabel.designLabel(message: "랜덤으로 BMI 계산하기", fontType: .REGULAR, fontSize: 11, alignment: .right, textColor: .systemRed)
        
        heightTextField.designTexField(placeholder: "cm")
        weightTextField.designTexField(placeholder: "kg")
        
        resetButton.tintColor = .black
        resetButton.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        
        secureButton.tintColor = .lightGray
        secureButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        secureButton.setImage(UIImage(systemName: "eye"), for: .selected)
        
        resultButton.setTitle("결과 확인", for: .normal)
        resultButton.backgroundColor = .systemYellow
        resultButton.setTitleColor(.black, for: .normal)
        resultButton.setTitleColor(.lightGray, for: .disabled)
        resultButton.setTitleColor(.darkGray, for: .highlighted)
        resultButton.layer.cornerRadius = 10
        
        setTextFieldText(heightTextField, text: height == nil ? "" : height!)
        setTextFieldText(weightTextField, text: weight == nil ? "" : weight!)
    }
    
    func changeResultButtonState(_ firstTextField: UITextField, _ secondTextField: UITextField) {
        resultButton.isEnabled = !(firstTextField.text == "" || secondTextField.text == "")
    }
    
    func calculateBMI(height: Double, weight: Double) -> (Double, BMIType) {
        let heightForC = height / 100
        let bmi = weight / (heightForC * heightForC)
        var bmiType = BMIType.NORMALWEIGHT
        
        if case 0 ..< 18.5 = bmi {
            bmiType = .UNDERWEIGHT
        } else if case 18.5 ..< 23 = bmi {
            bmiType = .NORMALWEIGHT
        } else if case 23 ..< 25 = bmi {
            bmiType = .OVERWEIGHT
        } else if case 25... = bmi {
            bmiType = .HEAVYWEIGHT
        }
        
        return (bmi, bmiType)
    }
    
    @objc func viewDismissKeyboard(_ sender: UITapGestureRecognizer) {
        mainView.endEditing(true)
    }
    
    @objc func randomClicked(_ sender: UITapGestureRecognizer) {
        let randomHeight = Int.random(in: 1 ... Constant.VALUE.HeightMAX)
        let randomWeight = Int.random(in: 1 ... Constant.VALUE.WeightMAX)
        
        setTextFieldText(heightTextField, text: "\(randomHeight)")
        setTextFieldText(weightTextField, text: "\(randomWeight)")
        
        UIView.animate(withDuration: 0.05, delay: 0, options: .autoreverse, animations: {
            self.randomLabel.transform = CGAffineTransform(translationX: -2, y: 0)
        }, completion: { _ in
            self.randomLabel.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }
    
    @IBAction func resetButtonClicked(_ sender: UIButton) {
        UserDefaults.standard.setValue("", forKey: Constant.KEY.LASTHEIGHT)
        UserDefaults.standard.setValue("", forKey: Constant.KEY.LASTWEIGHT)
        UserDefaults.standard.setValue("", forKey: Constant.KEY.LASTNICKNAME)
        UserDefaults.standard.setValue(false, forKey: Constant.KEY.AUTOLOGIN)
        
        setTextFieldText(heightTextField, text: "")
        setTextFieldText(weightTextField, text: "")
        
        UIView.animate(withDuration: 0.5, delay: 0) {
            self.resetButton.transform = CGAffineTransform(rotationAngle: 5)
        }
        // dismiss(animated: true) { }
    }
    
    @IBAction func userInputData(_ sender: UITextField) {
        resultButton.isEnabled = false
        
        guard let data = sender.text else { return }
        
        // 숫자 제약
        guard let numData = Int(data) else {
            sender.text = ""
            sender.placeholder = "숫자만 입력해주세요."
            return
        }
        
        // 최대 3글자 제약
        if data.count > 3 {
            sender.text = ""
            sender.placeholder = "최대 세자리까지 입력해주세요."
            return
        }
        
        // 텍스트필드 별 범위 제약
        let minimum = 0
        let maximum = sender.tag == 0 ? Constant.VALUE.HeightMAX : Constant.VALUE.WeightMAX
        
        if numData <= minimum || numData > maximum {
            sender.text = ""
            sender.placeholder = "1 ~ \(maximum) 사이로 입력해주세요."
            return
        }
        
        sender.tag == 0 ? setTextFieldText(heightTextField, text: "\(numData)") : setTextFieldText(weightTextField, text: "\(numData)")
    }
    
    
    @IBAction func didEndUserInput(_ sender: UITextField) {
        if sender.text == "" { sender.placeholder = sender.tag == 0 ? "cm" : "kg"}
    }
    
    @IBAction func secureButtonClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        weightTextField.isSecureTextEntry = sender.isSelected
    }
    
    @IBAction func resultButtonClicked(_ sender: UIButton) {
        guard let heightData = heightTextField.text else { return }
        guard let weightData = weightTextField.text else { return }
        guard let height = Double(heightData) else { return }
        guard let weight = Double(weightData) else { return }
        
        // 결과 확인 시 저장
        UserDefaults.standard.setValue(heightData, forKey: Constant.KEY.LASTHEIGHT)
        UserDefaults.standard.setValue(weightData, forKey: Constant.KEY.LASTWEIGHT)
        
        let (bmi, bmiType) = calculateBMI(height: height, weight: weight)
        
        let stringBMI = String(format: "%.1f", bmi)
        let alert = UIAlertController(title: "BMI 결과", message: "결과는 \(stringBMI)으로 \(bmiType.rawValue)입니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
    }
    
    @IBAction func dismissKeyboard(_ sender: UITextField) {
    }
}
