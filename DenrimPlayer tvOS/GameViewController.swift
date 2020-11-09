//
//  GameViewController.swift
//  DenrimPlayer tvOS
//
//  Created by Markus Moenig on 8/11/20.
//

import UIKit
import MetalKit

import DenrimTV

// Our iOS specific view controller
class GameViewController: UIViewController {
    var dmtkView    : DMTKView!
    var renderer    : Renderer!

    var game        : Game!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let dmtkView = self.view as? DMTKView else {
            print("View attached to GameViewController is not an DMTKView")
            return
        }
        
        guard let path = Bundle.main.path(forResource: "game", ofType: "denrim", inDirectory: "") else {
            return
        }
        
        game = Game("com.moenig.DenrimTV")
        renderer = Renderer(game: game, metalKitView: dmtkView)
        
        if let gameResource = try? String(contentsOfFile: path, encoding: String.Encoding.utf8) {
            if let data = gameResource.data(using: .utf8) {
                game.load(data)
            }
        }

        dmtkView.delegate = renderer

        game.setupView(dmtkView)
        game.start()
    }
}
