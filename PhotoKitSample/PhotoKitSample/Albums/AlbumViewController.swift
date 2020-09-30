//
//  ViewController.swift
//  PhotoKitSample
//
//  Created by cskim on 2020/07/08.
//  Copyright © 2020 cskim. All rights reserved.
//

import UIKit
import Photos

class AlbumViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var typeLabel: UILabel!
  @IBOutlet weak var subtypeLabel: UILabel!
  @IBOutlet weak var albumCount: UILabel!
  
  private var albums = PHFetchResult<PHAssetCollection>() {
    didSet {
      self.tableView.reloadData()
    }
  }
  
  private var subtypes: [PHAssetCollectionType: [PHAssetCollectionSubtype]] = {
    var dic = [PHAssetCollectionType: [PHAssetCollectionSubtype]]()
    dic[.album] = PHAssetCollectionSubtype.allCases.filter { $0.description.hasPrefix("album") || $0 == .any }
    dic[.smartAlbum] = PHAssetCollectionSubtype.allCases.filter { $0.description.hasPrefix("smart") || $0 == .any }
    return dic
  }()
  
  private var currentTypes: (type: PHAssetCollectionType, subtype: PHAssetCollectionSubtype) = (.album, .any) {
    didSet {
      let newType = currentTypes.type
      let newSubtype = oldValue.type == newType ? currentTypes.subtype : .any
      
      self.albums = self.fetchAlbums(with: newType, subtype: newSubtype)
    }
  }
  
  private var assets = PHFetchResult<PHAsset>()
  
  // MARK: Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.checkAuthorization { isAuthorized in
      if isAuthorized {
        DispatchQueue.main.async { [weak self] in
          guard let self = self else { return }
          self.albums = self.fetchAlbums(with: .smartAlbum, subtype: .smartAlbumUserLibrary)
        }
      }
    }
  }
  
  // MARK: Setup UI
  
  private func displayCurrentTypes(type: PHAssetCollectionType, subtype: PHAssetCollectionSubtype) {
    self.typeLabel.text = type.description
    self.subtypeLabel.text = subtype.description
  }
  
  // MARK: Segue
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let selectedIndex = self.tableView.indexPathForSelectedRow?.row else { return }
    
    super.prepare(for: segue, sender: sender)
    
    guard let vc = segue.destination as? PhotosViewController else { return }
    let selectedAlbum = self.albums.object(at: selectedIndex)
    vc.assets = self.fetchAssets(in: selectedAlbum)
    vc.navigationItem.title = selectedAlbum.localizedTitle ?? ""
  }
  
  // MARK: Actions
  
  @IBAction func changeType(_ sender: UIBarButtonItem) {
    let alert = UIAlertController(title: "Type", message: nil, preferredStyle: .actionSheet)
    PHAssetCollectionType.allCases.forEach {
      alert.addAction(UIAlertAction(title: $0.description, style: .default, handler: { (action) in
        if let title = action.title, let type = PHAssetCollectionType(stringValue: title) {
          self.currentTypes.type = type
        }
      }))
    }
    self.present(alert, animated: true)
  }
  
  @IBAction func changeSubtype(_ sender: UIBarButtonItem) {
    let alert = UIAlertController(title: "Subtype", message: nil, preferredStyle: .actionSheet)
    self.subtypes[self.currentTypes.type]?.forEach {
      alert.addAction(UIAlertAction(title: $0.description, style: .default, handler: { (action) in
        if let title = action.title, let type = PHAssetCollectionSubtype(stringValue: title) {
          self.currentTypes.subtype = type
        }
      }))
    }
    self.present(alert, animated: true)
  }
  
}

// MARK: - Fetch Collections

extension AlbumViewController {
  
  private func checkAuthorization(handler: @escaping (_ isAuthorized: Bool)->Void) {
    let status = PHPhotoLibrary.authorizationStatus()
    switch status {
    case .authorized:
      print("Allow access to photo library")
      handler(true)
    case .denied:
      print("Access to photo library is denied. Please ")
      handler(false)
    case .notDetermined:
      print("Need to permission")
      PHPhotoLibrary.requestAuthorization { (status) in
        switch status {
        case .authorized:   handler(true)
        default:            handler(false)
        }
      }
    case .restricted:
      print("Restricted")
      handler(false)
    default:
      break
    }
  }
  
  private func fetchAlbums(with type: PHAssetCollectionType, subtype: PHAssetCollectionSubtype, options: PHFetchOptions? = nil) -> PHFetchResult<PHAssetCollection> {
    self.displayCurrentTypes(type: type, subtype: subtype)
    return PHAssetCollection.fetchAssetCollections(with: type, subtype: subtype, options: options)
  }
  
  private func fetchAssets(in collection: PHAssetCollection) -> PHFetchResult<PHAsset> {
    let options = PHFetchOptions()
    options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
    return PHAsset.fetchAssets(in: collection, options: options)
  }
  
}

// MARK: - UITableViewDataSource

extension AlbumViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.albums.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath)
    
    let collection = self.albums.object(at: indexPath.row)
    
    // Title 설정
    cell.textLabel?.text = collection.localizedTitle ?? "Unknown"
    cell.detailTextLabel?.text = String(assets.count)
    
    return cell
  }
}
