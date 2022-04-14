//
//  HomePageViewController.swift
//  Wordle
//
//  Created by Abir T on 4/2/22.
//

import UIKit
import SwiftUI

class HomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

    struct SwiftUIView: View {
        let columns:[GridItem] = [
            GridItem(.fixed(50),spacing:nil ,alignment: nil), //1
            GridItem(.fixed(50),spacing:nil ,alignment: nil), //2
            GridItem(.fixed(50),spacing:nil ,alignment: nil), //3
            GridItem(.fixed(50),spacing:nil ,alignment: nil), //4
            GridItem(.fixed(50),spacing:nil ,alignment: nil) //5
            
        ]
        var body: some View {
      
            LazyVGrid(columns: columns,
                      content:{
                Section(header:Text("Werdle")){
                    ForEach(0..<30){index in
                     
                        Rectangle().frame(height:50)
                    
                }
                }})
            
            
               
                    
                }
               
                    
                }
             
                
            
        


    struct SwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            SwiftUIView()
        }
    }


 


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
