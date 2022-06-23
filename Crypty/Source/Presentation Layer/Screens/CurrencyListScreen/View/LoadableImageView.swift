//
//  LoadableImageView.swift
//  Crypty
//
//  Created by Nikita Kirshin on 23.06.2022.
//

import UIKit

class LoadableImageView: UIImageView {
    var url: URL? {
        didSet{
            guard let url = url, url != oldValue else { return }
            loadImage(from: url)
        }
    }
    let queue = DispatchQueue(label: "loadableImageView.loadImage",
                              qos: .utility,
                              attributes: .concurrent)
    
    func loadImage(from url: URL) {
        let request = URLRequest(url: url)
        
        let session = URLSession.shared.downloadTask(with: request) { url, response, error in
            guard let url = url else { return }
            if let data = try? Data(contentsOf: url){
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }
        queue.async {
            session.resume()
        }
    }
}
