//
//  UIImage+Extension.swift
//  Homework2.4-MiniOrganizer
//
//  Created by vtsyganov on 30.05.2021.
//

import Foundation
import UIKit

public protocol ImageCodable: Codable {}
extension UIImage: ImageCodable {}

extension ImageCodable where Self: UIImage {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.init(data: try container.decode(Data.self))!
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.pngData()!)
    }
}
