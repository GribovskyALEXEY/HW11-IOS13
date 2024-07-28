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
        label.font = UIFont.preferredFont(forTextStyle: .extraLargeTitle)
        return label
    }()

    private lazy var userLoginTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
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
        textField.textColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
        textField.textAlignment = .left
        textField.placeholder = "Password"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 20
        textField.setLeftIcon(UIImage(named: "lockIcon") ?? UIImage.remove)
        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(red: 106/255, green: 117/255, blue: 206/255, alpha: 1)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        button.layer.masksToBounds = false
        return button
    }()

    private lazy var forgotYourPasswordButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.backgroundColor = .clear
        button.setTitle("Forgot your password?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.addTarget(self, action: #selector(forgotYourPasswordButtonPressed), for: .touchUpInside)
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        button.layer.masksToBounds = false
        return button
    }()

    private lazy var orConnectWithLabel: UILabel = {
        let label = UILabel()
        label.text = "⎯⎯⎯⎯⎯⎯⎯ or connect with ⎯⎯⎯⎯⎯⎯⎯"
        label.textColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        return label
    }()

    private lazy var facebookButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 16
        button.backgroundColor = UIColor(red: 60/255, green: 166/255, blue: 240/255, alpha: 1)
        button.setTitle("Facebook", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.addTarget(self, action: #selector(connectViaFacebookPressed), for: .touchUpInside)
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        button.layer.masksToBounds = false
        return button
    }()

    private lazy var twitterButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 16
        button.backgroundColor = UIColor(red: 81/255, green: 114/255, blue: 181/255, alpha: 1)
        button.setTitle("Twitter", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.addTarget(self, action: #selector(connectViaTwitterPressed), for: .touchUpInside)
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        button.layer.masksToBounds = false
        return button
    }()

    private lazy var dontHaveAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have account?"
        label.textColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        return label
    }()

    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.backgroundColor = .clear
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        button.layer.masksToBounds = false
        return button
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup
    func setupHierarchy() {
        [backgroundImage,
         mainLabel,
         userLoginTextField,
         userPasswordTextField,
         loginButton,
         forgotYourPasswordButton,
         orConnectWithLabel,
         facebookButton,
         twitterButton,
         dontHaveAccountLabel,
         signUpButton].forEach { view.addSubview($0) }
    }

    private func setupLayout() {
        mainLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(120)
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

        loginButton.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.centerY.equalTo(userPasswordTextField.snp.bottom).offset(90)
            $0.height.equalTo(40)
            $0.width.equalTo(250)
        }

        forgotYourPasswordButton.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.centerY.equalTo(loginButton.snp.bottom).offset(30)
            $0.height.equalTo(40)
            $0.width.equalTo(250)
        }

        orConnectWithLabel.snp.makeConstraints{
            $0.centerX.equalTo(view)
            $0.centerY.equalTo(userPasswordTextField.snp.bottom).offset(350)
        }

        facebookButton.snp.makeConstraints {
            $0.centerX.equalTo(view).offset(-70)
            $0.centerY.equalTo(orConnectWithLabel.snp.bottom).offset(40)
            $0.height.equalTo(32)
            $0.width.equalTo(130)
        }

        twitterButton.snp.makeConstraints {
            $0.centerX.equalTo(view).offset(70)
            $0.centerY.equalTo(orConnectWithLabel.snp.bottom).offset(40)
            $0.height.equalTo(32)
            $0.width.equalTo(130)
        }

        dontHaveAccountLabel.snp.makeConstraints{
            $0.centerX.equalTo(view).offset(-40)
            $0.centerY.equalTo(orConnectWithLabel.snp.bottom).offset(100)
        }

        signUpButton.snp.makeConstraints{
            $0.centerX.equalTo(view).offset(50)
            $0.centerY.equalTo(orConnectWithLabel.snp.bottom).offset(100)
        }
    }

    // MARK: - Actions
    @objc
    private func loginButtonPressed() {
        print("Login button was pressed")
    }

    @objc
    private func forgotYourPasswordButtonPressed() {
        print("Forgot your password button was pressed")
    }

    @objc
    private func connectViaFacebookPressed() {
        print("Authorization via Facebook")
    }

    @objc
    private func connectViaTwitterPressed() {
        print("Authorization via Twitter")
    }

    @objc
    private func signUpButtonPressed() {
        print("Sign Up")
    }
}







