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
    @IBOutlet var secureButton: UIButton!
    @IBOutlet var resultButton: UIButton!
    let heightMax = 230
    let weightMax = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designUI()
        
        heightTextField.tag = 0
        weightTextField.tag = 1
        
        resultButton.isEnabled = false
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(randomClicked(_:)))
        randomLabel.isUserInteractionEnabled = true
        randomLabel.addGestureRecognizer(tapGesture)
        
        let mainViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(viewDismissKeyboard(_:)))
        mainView.isUserInteractionEnabled = true
        mainView.addGestureRecognizer(mainViewTapGesture)
    }
    
    func designUI() {
        designLabel(titleLabel, message: "BMI Calculator", fontType: .BOLD, fontSize: 30)
        designLabel(subtitleLabel, message: "당신의 BMI 지수를 \n알려드릴게요", fontType: .REGULAR, fontSize: 16, line: 2)
        designLabel(heightLabel, message: "키가 어떻게 되시나요?", fontType: .REGULAR, fontSize: 14)
        designLabel(weightLabel, message: "몸무게가 어떻게 되시나요?", fontType: .REGULAR, fontSize: 14)
        designLabel(randomLabel, message: "랜덤으로 BMI 계산하기", fontType: .REGULAR, fontSize: 11, alignment: .right, textColor: .systemRed)
        
        designTexField(heightTextField, placeholder: "cm")
        designTexField(weightTextField, placeholder: "kg")
        
        secureButton.tintColor = .lightGray
        secureButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        secureButton.setImage(UIImage(systemName: "eye"), for: .selected)
        
        resultButton.setTitle("결과 확인", for: .normal)
        resultButton.backgroundColor = .systemYellow
        resultButton.setTitleColor(.black, for: .normal)
        resultButton.setTitleColor(.lightGray, for: .disabled)
        resultButton.setTitleColor(.darkGray, for: .highlighted)

        resultButton.layer.cornerRadius = 10
    }
    
    func designLabel(_ label: UILabel, message: String, fontType: FontType, fontSize: CGFloat, line: Int = 1, alignment: NSTextAlignment = .left, textColor: UIColor = .black) {
        label.text = message
        label.textColor = textColor
        label.font = fontType == .BOLD ? .boldSystemFont(ofSize: fontSize) : .systemFont(ofSize: fontSize)
        label.numberOfLines = line
        label.textAlignment = alignment
    }
    
    func designTexField(_ textField: UITextField, placeholder: String) {
        textField.textColor = .black
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 15
        textField.placeholder = placeholder
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
    }
    
    func changeResultButtonState(_ firstTextField: UITextField, _ secondTextField: UITextField) {
        if !(firstTextField.text == "" || secondTextField.text == "") { resultButton.isEnabled = true }
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
        let randomHeight = Int.random(in: 1 ... heightMax)
        let randomWeight = Int.random(in: 1 ... weightMax)
        
        heightTextField.text = "\(randomHeight)"
        weightTextField.text = "\(randomWeight)"
        
        UIView.animate(withDuration: 0.05, delay: 0, options: .autoreverse, animations: {
            self.randomLabel.transform = CGAffineTransform(translationX: -2, y: 0)
        }, completion: { _ in
            self.randomLabel.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        
        changeResultButtonState(heightTextField, weightTextField)
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
        let maximum = sender.tag == 0 ? heightMax : weightMax
        
        if numData <= minimum || numData > maximum {
            sender.text = ""
            sender.placeholder = "1 ~ \(maximum) 사이로 입력해주세요."
            return
        }
        
        sender.tag == 0 ? (heightTextField.text = "\(numData)") : (weightTextField.text = "\(numData)")
        
        // 둘 다 값이 입력됐으면 result 버튼 활성화
        changeResultButtonState(heightTextField, weightTextField)
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
