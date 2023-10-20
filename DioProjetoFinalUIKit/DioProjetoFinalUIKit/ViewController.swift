//
//  ViewController.swift
//  DioProjetoFinalUIKit
//
//  Created by Rodrigo Ferreira Pereira on 20/10/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var jokeLabel: UILabel!
    @IBOutlet weak var loadJokeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loadJokeButtonTapped(_ sender: UIButton) {
        let apiUrl = "https://api.chucknorris.io/jokes/random"
        
        // Use Alamofire para fazer a chamada à API
        AF.request(apiUrl).responseDecodable(of: ChuckNorrisJoke.self) { response in
            print("Dentro do bloco de resposta")
            switch response.result {
            case .success(let jokeData):
                // Atualize o rótulo com a piada recebida
                self.jokeLabel.text = jokeData.value
            case .failure(let error):
                // Lida com erros, se houver algum
                self.jokeLabel.text = "Erro ao carregar a piada"
                print("Erro ao carregar a piada: \(error)")
            }
        }
    }
}

struct ChuckNorrisJoke: Decodable {
    let id: String
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case value = "value"
    }
}
