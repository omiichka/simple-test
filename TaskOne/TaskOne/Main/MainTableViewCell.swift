//
//  MainTableViewCell.swift
//  TaskOne
//
//  Created by Artem Golovanev on 6/13/20.
//  Copyright © 2020 Artem Golovanev. All rights reserved.
//

import UIKit

final class MainTableViewCell: UITableViewCell {
    
    private let contentImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        contentImageView.frame = CGRect(x: frame.width / 2 - 100 / 4, y: center.y, width: 100, height: 100)
        addSubview(contentImageView)
    }
    
    func setImage(image: UIImage) {
        contentImageView.image = image
    }

}
