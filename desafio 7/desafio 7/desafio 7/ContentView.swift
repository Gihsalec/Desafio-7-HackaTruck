//
//  ContentView.swift
//  desafio 7
//
//  Created by Turma01-5 on 28/04/26.
//

import SwiftUI

struct HaPo: Codable, Identifiable{
    let id: String
    let name: String?
    let alternate_names:[String]?
    let species:String?
    let gender: String?
    let house: String?
    let dateOfBirth: String?
    let yearOfBirth: Int?
    let wizard: Bool?
    let ancestry: String?
    let eyeColour: String?
    let hairColour: String?
    let wand: Wand
    let patronus: String?
    let hogwartsStudent:Bool?
    let hogwartsStaff: Bool?
    let actor: String?
    let alternate_actors:[String]?
    let alive: Bool?
    let image: String?
}

struct Wand: Codable {
    let wood:String?
    let core:String?
    let length:Double?
}

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationStack{
            ScrollView{
                ZStack{
                    Color("fundo")
                        .ignoresSafeArea()
                    VStack {
                        Image("img")
                            .resizable()
                            .scaledToFill()
                        
                        Spacer()
                        
                        ForEach(viewModel.personagem){personagem in NavigationLink(destination: PersonView(HP: personagem)){
                            HStack{
                                AsyncImage(url: URL(string: personagem.image!)){
                                    image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width:100,height:100)
                                .clipShape(Circle())
                                
                                Spacer()
                                Text(personagem.name!)
                                    .foregroundStyle(.yellow)
                                }
                            }
                        }
                    }
                }
            }
            .ignoresSafeArea()
        }.onAppear(){
            viewModel.fetch()
        }
    }
}
            
        

#Preview {
    ContentView()
}
