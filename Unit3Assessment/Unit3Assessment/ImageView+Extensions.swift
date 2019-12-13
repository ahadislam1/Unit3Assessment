//
//  ImageView+Extensions.swift
//  Unit3Assessment
//
//  Created by Ahad Islam on 12/12/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import UIKit

// here we crate an extension on UIImageView to hand off getting a UIImage using
// our URLSession wrapper class (NetworkHelper)

@available(iOS 13.0, *)
extension UIImageView {
  func getImage(with urlString: String,
                completion: @escaping (Result<UIImage, AppError>) -> ()) {
    
    // The UIActivityIndicatorView is used to indicate to the user that a download is in progress
    let activityIndicator = UIActivityIndicatorView(style: .large)
    activityIndicator.color = .systemTeal
    activityIndicator.startAnimating() // it's hidden until we explicitly start animating
    activityIndicator.center = center
    addSubview(activityIndicator) // we add the indicattor as a subview of the image view
    
    guard let url = URL(string: urlString) else {
        completion(.failure(.badURL))
        return
    }
        
    NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { [weak activityIndicator] (result) in
        DispatchQueue.main.async {
            activityIndicator?.stopAnimating()
        }
        switch result {
        case .failure(let error):
            completion(.failure(.networkClientError(error)))
        case .success(let data):
            if let image = UIImage(data: data) {
                completion(.success(image))
            } else {
                completion(.failure(.imageDecodingError))
            }
        }
    }
  }
}
