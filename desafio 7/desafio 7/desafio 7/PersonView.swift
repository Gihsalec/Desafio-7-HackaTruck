//
//  PersonView.swift
//  desafio 7
//
//  Created by Turma01-5 on 28/04/26.
//

import SwiftUI

struct PersonView: View {
    @State var HP: HaPo
    var body: some View {
        ZStack{
            Image("img")
                .scaledToFill()
                .scaledToFill()
                .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0, maxHeight: .infinity)
                .opacity(0.3)
                
            VStack{
                AsyncImage(url: URL(string: HP.image!)){
                    image in
                    image
                        .resizable()
                        .scaledToFill()
                }placeholder: {
                    ProgressView()
                }
                .frame(width:200, height:200)
                .clipShape(Circle())
                
                Text("""
                     Casa: \(HP.house ?? "")
                     Nome: \(HP.name ?? "")
                     Data de nascimento: \(HP.dateOfBirth ?? "")
                     Cor do olho: \(HP.eyeColour ?? "")
                     """)
                    .foregroundStyle(.black)
                    .background(Color("fundo"))
                Spacer()
            }
        }
        
    }
}

#Preview {
    PersonView(HP: HaPo(id:"",name:"",alternate_names: [], species:"", gender: "", house: "", dateOfBirth: "", yearOfBirth: 0, wizard:false,ancestry: "", eyeColour: "", hairColour: "", wand: Wand(wood: "", core:"", length:0), patronus: "", hogwartsStudent: false, hogwartsStaff: false, actor: "", alternate_actors: [], alive:false, image:""))
}
