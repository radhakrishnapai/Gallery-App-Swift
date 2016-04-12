//
//  CollectionListTableViewController.swift
//  Gallery App Swift
//
//  Created by Pai on 21/03/16.
//  Copyright © 2016 Pai. All rights reserved.
//

import UIKit
import Photos

class CollectionListTableViewController : UITableViewController {
    
    var albumFetchResult:PHFetchResult = PHFetchResult()
    
    override func viewDidLoad() {
        self.albumFetchResult = PHAssetCollection.fetchAssetCollectionsWithType(PHAssetCollectionType.Album, subtype: PHAssetCollectionSubtype.AlbumRegular, options: nil)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.albumFetchResult.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:AlbumListCell = tableView.dequeueReusableCellWithIdentifier("AlbumListCell", forIndexPath: indexPath) as! AlbumListCell
        let collection:PHAssetCollection = self.albumFetchResult[indexPath.row] as! PHAssetCollection
        
        cell.albumTitle.text = collection.localizedTitle
        cell.albumCount.text = "\(collection.estimatedAssetCount)"
        
        return cell
    }
    
}


