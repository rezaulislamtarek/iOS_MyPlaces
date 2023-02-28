//
//  PlaceSelectionView.swift
//  MyPlaces
//
//  Created by Rezaul Islam on 28/2/23.
//

import SwiftUI

struct PlaceSelectionView: View {
    
    @State private var selectedPlace : String?
    @State private var name = ""
    
    let places = ["Hospital","School","Bazar","Bank"]
    let onSelected: (String) -> Void
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("enter Name", text: $name)
                Picker("Places", selection: $selectedPlace){
                    ForEach(places, id: \.self){ place in
                        Text(place).tag(Optional(place))
                    }
                }.pickerStyle(.wheel)
                    .onChange(of: selectedPlace){ place in
                        if let place {
                            onSelected(place)
                        }
                    }
                NavigationLink(destination: DetailsView()){
                    Text("Going Details Screen")
                }
                Button("Tap Me"){
                    
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(20)
                
            }
        }
    }
}

struct PlaceSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceSelectionView{ place in
        }
    }
}
