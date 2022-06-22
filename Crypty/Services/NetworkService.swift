//
//  NetworkService.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation

protocol INetworkService: AnyObject {
    func loadCurrencyList<T:Decodable>(completion: @escaping (Result<T, Error>) -> Void)
//    func loadCurrencyData<T:Decodable>(currency: String, completion: @escaping (Result<T, Error>) -> Void)
//    func downloadCurrencies(completion: @escaping ((Result<CryptoDTO, Error>)) -> Void)


}

class NetworkService {
    
    enum Endpoints {
        static let url = "https://data.messari.io/api/v2/assets"
    }
}

extension NetworkService: INetworkService {
    
    func loadCurrencyList<T:Decodable>(completion: @escaping (Result<T, Error>) -> Void) {
            guard let url = URL(string: Endpoints.url) else { assert(false) }
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                }
                guard let data = data else { return }
                do {
                    print(data)
                    let newData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(newData))
                }
                catch let error {
                    completion(.failure(error))
                }
            }.resume()
        }
}
    

