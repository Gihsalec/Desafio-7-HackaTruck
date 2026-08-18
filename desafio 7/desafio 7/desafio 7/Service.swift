//
//  Service.swift
//  desafio 7
//
//  Created by Turma01-5 on 28/04/26.
//

import Foundation
import Combine

struct Service {
    func fetchHaPo(url: URL) -> AnyPublisher<[HaPo], Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [HaPo].self, decoder:JSONDecoder())
            .eraseToAnyPublisher()
    }
}
