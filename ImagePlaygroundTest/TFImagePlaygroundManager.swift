//
//  TFImagePlaygroundManager.swift
//  ImagePlaygroundTest
//
//  Created by Brendan Duddridge on 12/9/24.
//

import Cocoa
import ImagePlayground

@objc public protocol TFImagePlaygroundDelegate : AnyObject {
    @objc func didCreateImageAt(imageURL : URL)
    @objc func didCancelImageCreation(playgroundViewController : NSViewController)
}

// as soon as I add the ImagePlaygroundViewController.Delegate, I get an error in the
// ImagePlaygroundtest-Swift.h generated file. But I need this so that I can get
// the callbacks from the Image Playground to send the generated image to my Objective-C code.

class TFImagePlaygroundManager: NSObject, ImagePlaygroundViewController.Delegate {
    
    let delegate: TFImagePlaygroundDelegate?
    
    @objc public init(delegate: TFImagePlaygroundDelegate) {
        self.delegate = delegate
    }
    
    func imagePlaygroundViewController(_ imagePlaygroundViewController: ImagePlaygroundViewController, didCreateImageAt imageURL: URL) {
        delegate?.didCreateImageAt(imageURL: imageURL)
    }
    
    func imagePlaygroundViewControllerDidCancel(_ imagePlaygroundViewController: ImagePlaygroundViewController) {
        delegate?.didCancelImageCreation(playgroundViewController: imagePlaygroundViewController)
    }
    
    @MainActor @objc public func showImagePlayground(fromController controller: NSViewController) {
        let playgroundController = ImagePlaygroundViewController()
        playgroundController.delegate = self
        controller.presentAsModalWindow(playgroundController)
    }
    
}
