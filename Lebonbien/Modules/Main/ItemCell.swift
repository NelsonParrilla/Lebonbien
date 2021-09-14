//
//  MainTableViewCell.swift
//  Lebonbien
//
//  Created by nelson on 14/09/2021.
//

import UIKit
class ItemCell : UITableViewCell {

    var itemCellModel : ItemCellModel? {
        didSet {
            itemImageView.load(urlString: itemCellModel?.image ?? "")
            titleLabel.text = itemCellModel?.title
            priceLabel.text = itemCellModel?.price
            urgentLabel.text = "Urgent: " + (itemCellModel?.isUrgent ?? false ? "oui" : "non")
        }
    }

    private let itemImageView : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "imageLoader"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = false
        return imgView
    }()

    private let titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()


    private let priceLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()

    private let urgentLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(itemImageView)
        addSubview(titleLabel)
        addSubview(priceLabel)
        addSubview(urgentLabel)

        itemImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 0, enableInsets: false)
        titleLabel.anchor(top: topAnchor, left: itemImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 1.5, height: 0, enableInsets: false)
        priceLabel.anchor(top: titleLabel.bottomAnchor, left: itemImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 1.5, height: 0, enableInsets: false)
        urgentLabel.anchor(top: priceLabel.bottomAnchor, left: itemImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 1.5, height: 0, enableInsets: false)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
