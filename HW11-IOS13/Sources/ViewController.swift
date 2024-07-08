//
//  ViewController.swift
//  HW11-IOS13
//
//  Created by Alexey Gribovsky on 03.07.2024.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

    // MARK: - UI
    private lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImage(named: "backgroundImage")
        let backgroungImageView = UIImageView(image: backgroundImage)
        backgroungImageView.contentMode = .scaleAspectFill
        return backgroungImageView
    }()

    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return label
    }()

    private lazy var orConnectWithLabel: UILabel = {
        let label = UILabel()
        label.text = "⎯⎯⎯⎯⎯⎯ or connect with ⎯⎯⎯⎯⎯⎯"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        return label
    }()

    private lazy var dontHaveAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have account?"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        return label
    }()

    private lazy var userLoginTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = UIColor(red: 219/255, green: 219/255, blue: 219/255, alpha: 1)
        textField.textAlignment = .left
        textField.placeholder = "keanurives01"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 20
        textField.setLeftIcon(UIImage(named: "userIcon") ?? UIImage.remove)
        textField.setRightIcon(UIImage(named: "completeIcon") ?? UIImage.remove)
        return textField
    }()

    private lazy var userPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = UIColor(red: 219/255, green: 219/255, blue: 219/255, alpha: 1)
        textField.textAlignment = .left
        textField.placeholder = "password"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 20
        textField.setLeftIcon(UIImage(named: "lockIcon") ?? UIImage.remove)
        return textField
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup
    func setupHierarchy() {
        [backgroundImage, mainLabel, userLoginTextField, userPasswordTextField, orConnectWithLabel, dontHaveAccountLabel, ].forEach {
            view.addSubview($0)
        }
    }

    private func setupLayout() {
        mainLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-200)
        }

        orConnectWithLabel.snp.makeConstraints{
            $0.centerX.equalTo(view)
            $0.centerY.equalTo(mainLabel.snp.bottom).offset(300)
        }

        dontHaveAccountLabel.snp.makeConstraints{
            $0.centerX.equalTo(view).offset(-70)
            $0.centerY.equalTo(orConnectWithLabel.snp.bottom).offset(200)
        }

        userLoginTextField.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.centerY.equalTo(mainLabel.snp.bottom).offset(70)
            $0.height.equalTo(40)
            $0.width.equalTo(250)
        }

        userPasswordTextField.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.centerY.equalTo(userLoginTextField.snp.bottom).offset(40)
            $0.height.equalTo(40)
            $0.width.equalTo(250)
        }

    }

    // MARK: - Actions


}






