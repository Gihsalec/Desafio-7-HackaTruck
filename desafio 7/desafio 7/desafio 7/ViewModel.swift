//
//  ViewModel.swift
//  desafio 7
//
//  Created by Turma01-5 on 28/04/26.
//

import Foundation
import Combine

class ViewModel: ObservableObject{
    @Published var personagem: [HaPo] = []
    
    private let service = Service()
    private var cancellables = Set<AnyCancellable>()
    
    func fetch(){
        guard let url = URL(string: "https://hp-api.onrender.com/api/characters/house/gryffindor") else{
            return
        }
        
        service.fetchHaPo(url: url)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion:{_ in }) {personagens in self.personagem = personagens
            }
            .store(in: &cancellables)
    }
}
