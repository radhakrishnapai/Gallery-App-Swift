//
//  ViewController.swift
//  Gallery App Swift
//
//  Created by Pai on 21/03/16.
//  Copyright © 2016 Pai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        Utility.isPhotoLibraryEnabledWithCompletion({(granted: Bool) -> Void in
            if granted {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), { () -> Void in
                    self.performSegueWithIdentifier("ShowAlbumList", sender: self)
                })
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

