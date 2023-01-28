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
        client = OpenAI(authToken: "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")
    }
    
    func send(text: String, completion: @escaping (String) -> Void) {
        client?.sendCompletion(with: text, maxTokens: 1000, completionHandler: { result in
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
        ZStack {
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    
                    VStack(alignment: .leading) {
                        ForEach(models, id: \.self) { string in
                            Text(string)
                                .foregroundColor(.black)
                                .bold()
                        }
                        
                        Spacer()
                        
                        HStack {
                            TextField("Type here...", text: $text)
                                .bold()
                                .foregroundColor(.black)
                            Button("Send") {
                                send()
                            }
                        }
                    }
                    .onAppear {
                        viewModel.setup()
                    }
                    .padding()
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
                self.models.append("ChatGPT: "+response)
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
     
        

    
               
                        
                        
                        


                        
                        
    

                      

