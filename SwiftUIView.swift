//
//  SwiftUIView.swift
//  Wordle
//
//  Created by Abir T on 4/13/22.
//

import SwiftUI

let columns:[GridItem] = [
    GridItem(.fixed(50),spacing:nil ,alignment: nil), //1
    GridItem(.fixed(50),spacing:nil ,alignment: nil), //2
    GridItem(.fixed(50),spacing:nil ,alignment: nil), //3
    GridItem(.fixed(50),spacing:nil ,alignment: nil), //4
    GridItem(.fixed(50),spacing:nil ,alignment: nil) //5
    
]

struct SwiftUIView: View {
    var body: some View {
        LazyVGrid(columns: columns) {ForEach(0..<30){index in
         
            Rectangle().frame(height:50)
           
                
            }
           
                
            }
         
            }
        
    


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
}
