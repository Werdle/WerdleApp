//
//  HomepageViewController.swift
//  Wordle
//
//  Created by Kan Wang on 4/12/22.
//

import UIKit
import GameKit
import Parse

class HomepageViewController: UIViewController {
    
   
    let answers = [
            "askew",
            "epoxy",
            "heist",
            "olive",
            "bytes",
            "flask",
            "polar",
            "elite",
            "which",
            "there",
            "their",
            "about",
            "would",
            "these",
            "other",
            "words",
            "could",
            "write",
            "first",
            "water",
            "after",
            "where",
            "right",
            "think",
            "three",
            "years",
            "place",
            "sound",
            "great",
            "again",
            "still",
            "every",
            "small"
        ]

        var answer = ""
        private var guesses: [[Character?]] = Array(
            repeating: Array(repeating: nil, count: 5),
            count: 6
        )

        let keyboardVC = KeyboardViewController()
        let boardVC = BoardViewController()

        override func viewDidLoad() {
            super.viewDidLoad()
            answer = answers.randomElement() ?? "after"
            view.backgroundColor = .black
            addChildren()
            
        }
    
   
    
        
    

        private func addChildren() {
            addChild(keyboardVC)
            keyboardVC.didMove(toParent: self)
            keyboardVC.delegate = self
            keyboardVC.view.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(keyboardVC.view)

            addChild(boardVC)
            boardVC.didMove(toParent: self)
            boardVC.view.translatesAutoresizingMaskIntoConstraints = false
            boardVC.datasource = self
            view.addSubview(boardVC.view)

            addConstraints()
        }

        func addConstraints() {
            NSLayoutConstraint.activate([
                boardVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                boardVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                boardVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                boardVC.view.bottomAnchor.constraint(equalTo: keyboardVC.view.topAnchor),
                boardVC.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),

                keyboardVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                keyboardVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                keyboardVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ])
        }
    }

    extension UIColor {
        convenience init(hexString: String, alpha: CGFloat = 1.0) {
            let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            let scanner = Scanner(string: hexString)
            if (hexString.hasPrefix("#")) {
                scanner.scanLocation = 1
            }
            var color: UInt32 = 0
            scanner.scanHexInt32(&color)
            let mask = 0x000000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask
            let red   = CGFloat(r) / 255.0
            let green = CGFloat(g) / 255.0
            let blue  = CGFloat(b) / 255.0
            self.init(red:red, green:green, blue:blue, alpha:alpha)
        }
        func toHexString() -> String {
            var r:CGFloat = 0
            var g:CGFloat = 0
            var b:CGFloat = 0
            var a:CGFloat = 0
            getRed(&r, green: &g, blue: &b, alpha: &a)
            let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
            return String(format:"#%06x", rgb)
        }
    }

    extension HomepageViewController: KeyboardViewControllerDelegate {
        func keyboardViewController(_ vc: KeyboardViewController, didTapKey letter: Character) {
            
            

            // Update guesses
            var stop = false

            for i in 0..<guesses.count {
                for j in 0..<guesses[i].count {
                    if guesses[i][j] == nil {
                        guesses[i][j] = letter
                        stop = true
                        
                        
                       
                        
                        break
                    }
                }

                if stop {
                   // self.viewDidLoad()
                   // self.viewWillAppear(true)
                  
                    break
                }
            }

            boardVC.reloadData()
        }
    }

    extension HomepageViewController: BoardViewControllerDatasource {
        var currentGuesses: [[Character?]] {
            return guesses
        }

        func boxColor(at indexPath: IndexPath) -> UIColor? {
            let rowIndex = indexPath.section
            

            let count = guesses[rowIndex].compactMap({ $0 }).count
            guard count == 5 else {
                return nil
            }

            let indexedAnswer = Array(answer)
            let popOff = indexedAnswer
            
        

            guard let letter = guesses[indexPath.section][indexPath.row],
                  indexedAnswer.contains(letter) else {
                return nil
            }

            if indexedAnswer[indexPath.row] == letter {
                let color = UIColor(hexString: "#0ED644")
                return color
            }


            return UIColor(hexString: "#CCD851")
        }
        
    
        
        
}

