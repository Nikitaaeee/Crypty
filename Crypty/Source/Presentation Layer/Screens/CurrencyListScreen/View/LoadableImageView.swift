//
//  LoadableImageView.swift
//  Crypty
//
//  Created by Nikita Kirshin on 23.06.2022.
//

import UIKit

final class LoadableImageView: UIImageView {
    
    //MARK: - Properties
    
    var url: URL? {
        didSet{
            guard let url = url, url != oldValue else { return }
            loadImage(from: url)
        }
    }
    let queue = DispatchQueue(label: "loadableImageView.loadImage",
                              qos: .utility,
                              attributes: .concurrent)
}

private extension LoadableImageView {
    func loadImage(from url: URL) {
        let request = URLRequest(url: url)
        let session = URLSession.shared.downloadTask(with: request) { url, response, error in
            guard let url = url else { return }
            if let data = try? Data(contentsOf: url){
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
            let resp = response as! HTTPURLResponse
            let status = resp.statusCode
            guard (200...299).contains(status) else {
                guard let url2 = URL(string: NetworkService.Endpoints.mockImageUrl)
                else {return}
                if let data = try? Data(contentsOf: url2){
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data)
                    }
                }
                return
            }
        }
        queue.async {
            session.resume()
        }
    }
}
