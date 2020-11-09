//
//  Renderer.swift
//  Denrim Player
//  DenrimPlayer macOS
//
//  Created by Markus Moenig on 9/11/20.
//

// Our platform independent renderer class

import Metal
import MetalKit
import simd

import DenrimMobile

class Renderer: NSObject, MTKViewDelegate {
    let game    : Game
    let view    : DMTKView
    
    init(game: Game, metalKitView: DMTKView) {
        self.game = game
        self.view = metalKitView
    }
    
    func draw(in view: MTKView) {
        game.draw()
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
    }
}
