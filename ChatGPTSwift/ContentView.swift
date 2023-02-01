//
//  ContentView.swift
//  ChatGPTSwift
//
//  Created by Tyler Wysocki on 1/25/23.
//

import OpenAI
import SwiftUI
    
final class ViewModel: ObservableObject {
    init() {}
    private var client: OpenAI?
    
    func setup() {
        client = OpenAI(authToken: "TOKEN")
    }
    
    func send(text: String, completion: @escaping (String) -> Void) {
        client?.sendCompletion(with: text, maxTokens: 500, completionHandler: { result in
            switch result {
            case.success(let model):
                let output = model.choices.first?.text ?? ""
                completion(output)
            case .failure:
                break
            }
        })
    }
}

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    @State var text = ""
    @State var models = [String]()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                ZStack {
                    VStack(alignment: .leading) {
                        ForEach(models, id: \.self) { string in
                            Text(string)
                                .foregroundColor(.primary)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(.secondary, lineWidth: 1)
                                        .foregroundColor(.primary)
                                )
                                .padding(3)
                        }
                                                
                        Spacer()
                        
                        HStack {
                            HStack(alignment: .bottom) {
                               TextField("Type here...", text: $text, axis: .vertical)
                                   .padding(6)
                                   .font(.body)
                                   .textInputAutocapitalization(.never)
                               
                               Spacer()
                               
                               VStack {
                                       Button(action: {
                                           send()
                                       }) {
                                           Image(systemName: "arrow.up.circle.fill")
                                               .resizable()
                                               .aspectRatio(contentMode: .fit)
                                       }
                               }
                               .frame(maxHeight: 35)
                           }
                           .frame(maxWidth: .infinity)
                           .padding(3)
                           .overlay(
                               RoundedRectangle(cornerRadius: 20)
                                   .stroke(.secondary, lineWidth: 1))
                       }
                       .padding(5)
                   }
                   .onAppear {
                       viewModel.setup()
                   }
                   .frame(minHeight: geometry.size.height)
               }
               .frame(width: geometry.size.width)
           }
       }
   }
   
   func send() {
       guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
           return
       }
       models.append("Me: \(text)")
           viewModel.send(text: text) { response in
           DispatchQueue.main.async {
               self.models.append("ChatGPT: " + response)
               self.text = ""
           }
       }
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
       ContentView()
   }
}
        

 
     
        

    
               
                        
                        
                        


                        
                        
    

                      

