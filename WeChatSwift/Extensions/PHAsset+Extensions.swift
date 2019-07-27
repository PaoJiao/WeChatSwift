//
//  PHAsset+Extensions.swift
//  WeChatSwift
//
//  Created by xu.shuifeng on 2019/7/26.
//  Copyright © 2019 alexiscn. All rights reserved.
//

import UIKit
import Photos
import CoreServices

extension PHAsset {
    
    var pixelSize: CGSize { return CGSize(width: pixelWidth, height: pixelHeight) }
    
    func thumbImage(with targetSize: CGSize) -> UIImage? {
        let options = PHImageRequestOptions()
        options.isSynchronous = true
        options.isNetworkAccessAllowed = true
        var resultImage: UIImage?
        PHImageManager.default().requestImage(for: self,
                                              targetSize: targetSize,
                                              contentMode: .aspectFill,
                                              options: options) { (image, _) in
            resultImage = image
        }
        return resultImage
    }
    
    var isGIF: Bool {
        if let imageType = value(forKey: "uniformTypeIdentifier") as? String {
            return imageType == (kUTTypeGIF as String)
        }
        return false
    }
}
