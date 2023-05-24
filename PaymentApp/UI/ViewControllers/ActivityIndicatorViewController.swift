//
//  ActivityIndicatorViewController.swift
//  PaymentApp
//
//  Created by Admin on 24.05.23.
//

import UIKit
import SnapKit

final class ActivityIndicatorViewController: UIViewController {

    //MARK: - UI Elements
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = .white
       
        return activityIndicatorView
    }()
    
    private lazy var activityProccessLabel: UILabel = {
        let activityProccessLabel: UILabel = UILabel()
        activityProccessLabel.textColor = .black
        activityProccessLabel.font = .systemFont(ofSize: 20,
                                                 weight: .medium)
        activityProccessLabel.numberOfLines = .zero
        activityProccessLabel.text = Constants.StaticLabelTitles.proccessingPayment
        
        return activityProccessLabel
    }()
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.applyBlur()
        createViewHierachy()
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startActivity()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopActivity()
    }
    //MARK: - Public Methods
    func dismissActivity(completion: @escaping () -> Void) {
        dismiss(animated: true,
                completion: completion)
    }
    //MARK: - Private Methods
    private func startActivity() {
        activityIndicator.startAnimating()
    }
    
    private func stopActivity() {
        activityIndicator.stopAnimating()
    }
}
//MARK: - Extensions
extension ActivityIndicatorViewController: Layout {
    
    func createViewHierachy() {
        view.addSubviews(
            activityIndicator,
            activityProccessLabel
        )
    }
    
    func layout() {
        activityIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        activityProccessLabel.snp.makeConstraints {
            $0.top.equalTo(activityIndicator.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
}
