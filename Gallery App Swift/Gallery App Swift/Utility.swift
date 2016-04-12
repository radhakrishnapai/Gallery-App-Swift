//
//  Utility.swift
//  Gallery App Swift
//
//  Created by Pai on 12/04/16.
//  Copyright © 2016 Pai. All rights reserved.
//

import Foundation
import Photos

class Utility: NSObject {
    class func isPhotoLibraryEnabledWithCompletion(closure: (granted: Bool) -> Void) {
        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.Authorized {
            closure(granted: true)
        } else {
            PHPhotoLibrary.requestAuthorization({ (status:PHAuthorizationStatus) -> Void in
                switch status {
                case PHAuthorizationStatus.Authorized:
                    closure(granted: true)
                    break
                case PHAuthorizationStatus.Restricted:
                    closure(granted: false)
                    break
                case PHAuthorizationStatus.Denied:
                    closure(granted: false)
                    break
                default:
                    closure(granted: true)
                    break
                }
            })
        }
    }
}