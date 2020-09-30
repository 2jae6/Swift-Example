//
//  Extensions.swift
//  PhotoKitSample
//
//  Created by cskim on 2020/07/10.
//  Copyright © 2020 cskim. All rights reserved.
//

import Photos

// MARK: - PHAssetCollectionType Cases

extension PHAssetCollectionType: CaseIterable {
  public typealias AllCases = [Self]
  
  public static var allCases: [PHAssetCollectionType] {
    return [
      .album,         // 나의 앨범 및 공유 앨범
      .smartAlbum     // iPhoto에서 자동으로 분류하는 항목들 위주.(전체 사진, 좋아요 누른 사진, 미디어 유형, 가려진 앨범 등)
    ]
  }
  
  init?(stringValue: String) {
    guard let type = PHAssetCollectionType.allCases.first(where: { $0.description == stringValue }) else { return nil }
    self = type
  }
  
  var description: String {
    switch self {
    case .album:        return "album"
    case .smartAlbum:   return "smartAlbum"
    default:            return ""
    }
  }
}

extension PHAssetCollectionSubtype: CaseIterable {
  public typealias AllCases = [Self]
  
  public static var allCases: [PHAssetCollectionSubtype] {
    return [
      .albumCloudShared,            // 공유 앨범. (An iCloud Shared Photo Stream.)
      .albumImported,               // An album imported from a camera or external storage.
      .albumMyPhotoStream,          // The user’s personal iCloud Photo Stream.
      .albumRegular,                // 나의 앨범. (An album created in the Photos app.)
      .albumSyncedAlbum,            // An album synced to the device from iPhoto.
      .albumSyncedEvent,            // An Event synced to the device from iPhoto.
      .albumSyncedFaces,            // A Faces group synced to the device from iPhoto.
      .any,                         // 모든 subtype에 대한 collection을 가져옴. PHAssetCollectionType에 따라 다르다
      .smartAlbumAllHidden,         // 다른 앨범의 가려짐 항목. (A smart album that groups all assets hidden from the Moments view in the Photos app.)
      .smartAlbumAnimated,          // 미디어 유형의 움직이는 항목. (A smart album that groups all image animation assets.)
      .smartAlbumBursts,            // 고속 연사 촬영 항목. (A smart album that groups all burst photo sequences in the photo library.)
      .smartAlbumDepthEffect,       // 인물 사진 항목. (A smart album that groups all images captured using the Depth Effect camera mode on compatible devices.)
      .smartAlbumFavorites,         // 나의 앨범의 즐겨찾는 항목. (A smart album that groups all assets that the user has marked as favorites.)
      .smartAlbumGeneric,           // A smart album of no more specific subtype.
      .smartAlbumLivePhotos,        // 라이브 포토 항목. (A smart album that groups all Live Photo assets.)
      .smartAlbumLongExposures,     // A smart album that groups all Live Photo assets where the Long Exposure variation is enabled.
      .smartAlbumPanoramas,         // 파노라마 항목. (A smart album that groups all panorama photos in the photo library.)
      .smartAlbumRecentlyAdded,     // 최근 추가된 사진? A smart album that groups assets that were recently added to the photo library.
      .smartAlbumScreenshots,       // 스크린샷 항목. A smart album that groups all images captured using the device’s screenshot function.
      .smartAlbumSelfPortraits,     // 셀카 항목. (A smart album that groups all photos and videos captured using the device’s front-facing camera.)
      .smartAlbumSlomoVideos,       // 슬로 모션 항목. (A smart album that groups all Slow-Mo videos in the photo library.)
      .smartAlbumTimelapses,        // 타임 랩스 항목. (A smart album that groups all time-lapse videos in the photo library.)
      .smartAlbumUnableToUpload,    // ??
      .smartAlbumUserLibrary,       // 전체 사진(최근 항목). (A smart album that groups all assets that originate in the user’s own library (as opposed to assets from iCloud Shared Albums).)
      .smartAlbumVideos             // 비디오 항목. (A smart album that groups all video assets in the photo library.)
    ]
  }
  
  init?(stringValue: String) {
    guard let type = PHAssetCollectionSubtype.allCases.first(where: { $0.description == stringValue }) else { return nil }
    self = type
  }
  
  var description: String {
    switch self {
    case .albumCloudShared:
      return "albumCloudShared"
    case .albumImported:
      return "albumImported"
    case .albumMyPhotoStream:
      return "albumMyPhotoStream"
    case .albumRegular:
      return "albumRegular"
    case .albumSyncedAlbum:
      return "albumSyncedAlbum"
    case .albumSyncedEvent:
      return "albumSyncedEvent"
    case .albumSyncedFaces:
      return "albumSyncedFaces"
    case .any:
      return "any"
    case .smartAlbumAllHidden:
      return "smartAlbumAllHidden"
    case .smartAlbumAnimated:
      return "smartAlbumAnimated"
    case .smartAlbumBursts:
      return "smartAlbumBursts"
    case .smartAlbumDepthEffect:
      return "smartAlbumDepthEffect"
    case .smartAlbumFavorites:
      return "smartAlbumFavorites"
    case .smartAlbumGeneric:
      return "smartAlbumGeneric"
    case .smartAlbumLivePhotos:
      return "smartAlbumLivePhotos"
    case .smartAlbumLongExposures:
      return "smartAlbumLongExposures"
    case .smartAlbumPanoramas:
      return "smartAlbumPanoramas"
    case .smartAlbumRecentlyAdded:
      return "smartAlbumRecentlyAdded"
    case .smartAlbumScreenshots:
      return "smartAlbumScreenshots"
    case .smartAlbumSelfPortraits:
      return "smartAlbumSelfPortraits"
    case .smartAlbumSlomoVideos:
      return "smartAlbumSlomoVideos"
    case .smartAlbumTimelapses:
      return "smartAlbumTimelapses"
    case .smartAlbumUnableToUpload:
      return "smartAlbumUnableToUpload"
    case .smartAlbumUserLibrary:
      return "smartAlbumUserLibrary"
    case .smartAlbumVideos:
      return "smartAlbumVideos"
    @unknown default:
      fatalError()
    }
  }
}
