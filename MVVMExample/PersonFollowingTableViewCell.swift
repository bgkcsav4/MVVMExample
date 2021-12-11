//
//  PersonFollowingTableViewCell.swift
//  MVVMExample
//
//  Created by Mariam Latsabidze on 12.12.21.
//

import UIKit


protocol PersonFollowingTableViewCellDelegate : AnyObject {
    func personFollowingTableViewCell (_ cell: PersonFollowingTableViewCell, didTapWith viewModel: PersonFollowingTableViewCellModel)
}


class PersonFollowingTableViewCell: UITableViewCell {

    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let usernamelabel : UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()
    
    private let button : UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    
    static let identifier = "PersonFollowingTableViewCell"
    weak var delegate: PersonFollowingTableViewCellDelegate?
    private var viewModel: PersonFollowingTableViewCellModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(userImageView)
        contentView.addSubview(usernamelabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(button)
        contentView.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    func configure(with viewModel: PersonFollowingTableViewCellModel) {
        self.viewModel = viewModel
        nameLabel.text = viewModel.name
        usernamelabel.text = viewModel.username
        imageView?.image = viewModel.image
        
        if viewModel.currentlyFollowing {
            button.setTitle("unfollow", for: .normal)
            button.setTitleColor(.blue, for: .normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
        } else {
            button.setTitle("follow", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.white.cgColor
            button.backgroundColor = .link
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapButton () {
        guard let viewModel = viewModel else {
            return
        }
        var newViewModel = viewModel
        newViewModel.currentlyFollowing = !viewModel.currentlyFollowing
        delegate?.personFollowingTableViewCell(self, didTapWith: newViewModel)
        
        prepareForReuse()
        configure(with: newViewModel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageWidth = contentView.frame.size.height-10
        userImageView.frame = CGRect(x: 5, y: 5,
                                     width: imageWidth,
                                     height: imageWidth)
        nameLabel.frame = CGRect(x: imageWidth+10, y: 0,
                                 width:contentView.frame.size.height+30,
                                 height: contentView.frame.size.height/2)
        usernamelabel.frame = CGRect(x: imageWidth+10,
                                     y: contentView.frame.size.height/2,
                                 width:contentView.frame.size.height+100,
                                 height: contentView.frame.size.height/2)
        button.frame = CGRect(x: contentView.frame.size.width-120,
                              y: 10, width: 110, height: contentView.frame.size.height-20)
}

    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        usernamelabel.text = nil
        userImageView.image = nil
        button.backgroundColor = nil
        button.layer.borderWidth = 0
        button.setTitle(nil, for: .normal)
    }
}
