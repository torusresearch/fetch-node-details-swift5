//
//  ContentView.swift
//  cptest
//
//  Created by Shubham on 12/6/20.
//  Copyright © 2020 torus. All rights reserved.
//

import FetchNodeDetails
import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    @State var success:Bool = false
    @State private var message = ""
    var body: some View {
        NavigationView{
            Form {
                Section(header:Text("")){
                    Button {
                        execute()
                    } label: {
                        Text("Get-node-details")
                            .foregroundColor(.black)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text(success ? "Success" : "Failure"), message: Text(message), dismissButton: .default(Text("Got it!")))
                    }
                }
            }
            .navigationBarTitle("FetchNodeDetail")
            .background(Color.gray)
        }
    }

    func execute() {
        Task {
            let fnd = FetchNodeDetails()
            do {
                let val = try await fnd.getNodeDetails(verifier: "google", verifierID: "hello@tor.us")
                print(val)
                success = true
                message = val.getNodeListAddress()
                showAlert = true
            } catch let err {
                success = false
                message = err.localizedDescription
                showAlert = true
            }
        }
    }
    
    func execute(){
        Task{
            let fnd = FetchNodeDetails(proxyAddress: "0x6258c9d6c12ed3edda59a1a6527e469517744aa7", network: .ROPSTEN)
            fnd.getNodeDetails(verifier : "google", verifierID : "hello@tor.us").done { result in
               print(result)
            }.catch { error in
                print(error)
            }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
