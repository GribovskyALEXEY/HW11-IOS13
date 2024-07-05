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
        label.text = "-----or connect with-----"
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


    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemFill
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup
    func setupHierarchy() {
        [mainLabel, orConnectWithLabel, dontHaveAccountLabel].forEach {
            view.addSubview($0)
        }
    }

    private func setupLayout() {
        mainLabel.snp.makeConstraints{
            $0.centerX.equalTo(view)
            $0.centerY.equalTo(view).offset(-200)
        }

        orConnectWithLabel.snp.makeConstraints{
            $0.centerX.equalTo(view)
            $0.centerY.equalTo(mainLabel.snp.bottom).offset(300)
        }

        dontHaveAccountLabel.snp.makeConstraints{
            $0.centerX.equalTo(view).offset(-70)
            $0.centerY.equalTo(orConnectWithLabel.snp.bottom).offset(200)
        }
    }

    // MARK: - Actions


}






