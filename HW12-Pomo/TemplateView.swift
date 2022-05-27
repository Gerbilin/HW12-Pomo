//
//  TemplateView.swift
//  HW12-Pomo
//
//  Created by Gerbilin Mac on 22.05.2022.
//

import UIKit

class TempateViewController: UIViewController {
    

    // MARK: - StackView
    
    private lazy var parentStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.spacing = Metric.parentStackViewSpacing
        stackView.distribution = .equalSpacing
        
        return stackView
    }()

    private lazy var avaNameStatus: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .horizontal
        stackView.spacing = Metric.topAvatarStatusStackViewSpacing

        return stackView
    }()

    private lazy var infoNameStatus: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading

        return stackView
    }()

    private lazy var iconStack: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading

        return stackView
    }()

    private lazy var menuStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.spacing = Metric.menuStackSpacing

        return stackView
    }()


    // MARK: - Elements
    
    private lazy var avaView: UIImageView = {
        let ava = UIImage(named: "ava.jpg")
        var view = UIImageView(frame: CGRect(x: 0,
                                             y: 0,
                                             width: Metric.avaView,
                                             height: Metric.avaView))
        view.image = ava

        view.clipsToBounds = true
        view.layer.cornerRadius = Metric.avaView / 2

        return view
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()

        label.text = Strings.nameText
        label.textColor = .white
        label.font = .systemFont(ofSize: Metric.nameLabelFontSize, weight: .medium)

        return label
    }()


    private lazy var nameButton = createStringButton(title: Strings.nameText,
                                                     fontSize: 20,
                                                     fontWeight: .semibold,
                                                     titleColor: .white,
                                                     backgroundColor: .clear)

    private lazy var setStatusButton = createStringButton(title: "Установить статус",
                                                          fontSize: 17,
                                                          fontWeight: .regular,
                                                          titleColor: #colorLiteral(red: 0.5254901961, green: 0.6823529412, blue: 0.8235294118, alpha: 1),
                                                          backgroundColor: .clear)

    private lazy var isOnlineButton: UIButton = {
        let button = createStringButton(title: "online",
                                        fontSize: 15,
                                        fontWeight: .light,
                                        titleColor: .lightGray,
                                        backgroundColor: .clear)
        let image = UIImage(systemName: "iphone")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 14), forImageIn: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        return button
    }()
    

    private lazy var editButton: UIButton = {
        let button = UIButton(type: .system)

        button.setTitle("Редактировать", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        button.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.1764705882, blue: 0.1843137255, alpha: 1)

        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12

        return button

    }()

    // MARK: - Icon Buttons

    private lazy var cameraButton = createImageStringButton(systemImage: "camera",
                                                               tintColor: #colorLiteral(red: 0.5254901961, green: 0.6823529412, blue: 0.8235294118, alpha: 1),
                                                               padding: 10,
                                                               imagePlacement: .top,
                                                               title: "История",
                                                               fontSize: Metric.icomMenuFontSize,
                                                               fontWeight: .light,
                                                               titleColor:  #colorLiteral(red: 0.5254901961, green: 0.6823529412, blue: 0.8235294118, alpha: 1),
                                                               backgroundColor: .clear)


    private lazy var writeButton = createImageStringButton(systemImage: "square.and.pencil",
                                                              tintColor: #colorLiteral(red: 0.5254901961, green: 0.6823529412, blue: 0.8235294118, alpha: 1),
                                                              padding: 10,
                                                              imagePlacement: .top,
                                                              title: "Запись",
                                                              fontSize: Metric.icomMenuFontSize,
                                                              fontWeight: .light,
                                                              titleColor:  #colorLiteral(red: 0.5254901961, green: 0.6823529412, blue: 0.8235294118, alpha: 1),
                                                              backgroundColor: .clear)
    

    private lazy var photoButton = createImageStringButton(systemImage: "photo",
                                                              tintColor: #colorLiteral(red: 0.5254901961, green: 0.6823529412, blue: 0.8235294118, alpha: 1),
                                                              padding: 10,
                                                              imagePlacement: .top,
                                                              title: "Фото",
                                                              fontSize: Metric.icomMenuFontSize,
                                                              fontWeight: .light,
                                                              titleColor:  #colorLiteral(red: 0.5254901961, green: 0.6823529412, blue: 0.8235294118, alpha: 1),
                                                              backgroundColor: .clear)


    private lazy var playButton = createImageStringButton(systemImage: "play.rectangle",
                                                              tintColor: #colorLiteral(red: 0.5254901961, green: 0.6823529412, blue: 0.8235294118, alpha: 1),
                                                              padding: 10,
                                                              imagePlacement: .top,
                                                              title: "Клип",
                                                              fontSize: Metric.icomMenuFontSize,
                                                              fontWeight: .light,
                                                              titleColor:  #colorLiteral(red: 0.5254901961, green: 0.6823529412, blue: 0.8235294118, alpha: 1),
                                                              backgroundColor: .clear)


    private lazy var cityButton = createImageStringButton(systemImage: "house",
                                                             tintColor: .gray,
                                                             padding: 15,
                                                             imagePlacement: .leading,
                                                             title: "Город: Москва",
                                                             fontSize: 20,
                                                             fontWeight: .light,
                                                             titleColor: .gray,
                                                             backgroundColor: .clear)

    private lazy var subscribersButton = createImageStringButton(systemImage:"dot.radiowaves.up.forward",
                                                                    tintColor: .gray,
                                                                    padding: 21,
                                                                    imagePlacement: .leading,
                                                                    title: "101 подписчик",
                                                                    fontSize: 20,
                                                                    fontWeight: .light,
                                                                    titleColor: .gray,
                                                                    backgroundColor: .clear)

    private lazy var workPlaceButton = createImageStringButton(systemImage: "creditcard",
                                                                  tintColor: #colorLiteral(red: 0.5254901961, green: 0.6823529412, blue: 0.8235294118, alpha: 1),
                                                                  padding: 15,
                                                                  imagePlacement: .leading,
                                                                  title: "Указать место работы",
                                                                  fontSize: 20,
                                                                  fontWeight: .light,
                                                                  titleColor:  #colorLiteral(red: 0.5254901961, green: 0.6823529412, blue: 0.8235294118, alpha: 1),
                                                                  backgroundColor: .clear)

    private lazy var getGiftButton = createImageStringButton(systemImage: "snowflake",
                                                                tintColor: #colorLiteral(red: 0.4456846118, green: 0.3789182901, blue: 0.7340885401, alpha: 1),
                                                                padding: 19,
                                                                imagePlacement: .leading,
                                                                title: "Получить подарок",
                                                                fontSize: 20,
                                                                fontWeight: .light,
                                                                titleColor: #colorLiteral(red: 0.4456846118, green: 0.3789182901, blue: 0.7340885401, alpha: 1),
                                                                backgroundColor: .clear)

    private lazy var infoButton = createImageStringButton(systemImage: "info.circle",
                                                                tintColor: .white,
                                                                padding: 16,
                                                                imagePlacement: .leading,
                                                                title: "Подробная информация",
                                                                fontSize: 20,
                                                                fontWeight: .light,
                                                                titleColor:.white,
                                                                backgroundColor: .clear)

    // MARK: - Activity
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupHierarchy()
        setupLayout()

    }

    //    MARK: - Settings
    private func setupView() {
        view.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.1176470588, blue: 0.1215686275, alpha: 1)
    }

    private func setupHierarchy() {
        
//      Добавляем основную view
        view.addSubview(parentStackView)
        parentStackView.addArrangedSubview(avaNameStatus)

        avaNameStatus.addArrangedSubview(avaView)
        avaNameStatus.addArrangedSubview(infoNameStatus)
        
        infoNameStatus.heightAnchor.constraint(equalToConstant: Metric.avaView).isActive = true
//        infoNameStatus.addArrangedSubview(nameLabel)
        
        infoNameStatus.addArrangedSubview(nameButton)
        infoNameStatus.addArrangedSubview(setStatusButton)
        infoNameStatus.addArrangedSubview(isOnlineButton)

        parentStackView.addArrangedSubview(editButton)

        parentStackView.addArrangedSubview(iconStack)
        iconStack.addArrangedSubview(cameraButton)
        iconStack.addArrangedSubview(writeButton)
        iconStack.addArrangedSubview(photoButton)
        iconStack.addArrangedSubview(playButton)

        parentStackView.addArrangedSubview(menuStackView)
        menuStackView.addArrangedSubview(cityButton)
        menuStackView.addArrangedSubview(subscribersButton)
        menuStackView.addArrangedSubview(workPlaceButton)
        menuStackView.addArrangedSubview(getGiftButton)
        menuStackView.addArrangedSubview(infoButton)
//
//
//        //        view.addSubview(avatarView)
//        //        view.addSubview(nameLabel)

    }

    private func setupLayout() {

        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 18).isActive = true
        parentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -18).isActive = true
        parentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true

        editButton.adjustsImageSizeForAccessibilityContentSizeCategory = false
        editButton.heightAnchor.constraint(equalToConstant: 43).isActive = true


    }
    private func createStringButton(title: String,
                                    fontSize: CGFloat,
                                    fontWeight: UIFont.Weight,
                                    titleColor: UIColor,
                                    backgroundColor: UIColor) -> UIButton {

        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        button.backgroundColor = backgroundColor

        return button
    }

    private func createImageStringButton (systemImage: String,
                                             tintColor: UIColor,
                                             padding: CGFloat,
                                             imagePlacement: NSDirectionalRectEdge,
                                             title: String,
                                             fontSize: CGFloat,
                                             fontWeight: UIFont.Weight,
                                             titleColor: UIColor,
                                             backgroundColor: UIColor) -> UIButton {

        let button = UIButton(type: .system)
        var config = UIButton.Configuration.plain()
        config.imagePadding = padding
        config.imagePlacement = imagePlacement
        button.configuration = config

        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        button.backgroundColor = backgroundColor

        let image = UIImage(systemName: systemImage)?.withTintColor(tintColor, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)

        return button
    }


}


// MARK: - Constants
extension TempateViewController {

    enum Metric {

        static let parentStackViewSpacing: CGFloat = 20
        static let topAvatarStatusStackViewSpacing: CGFloat = 15
        
        static let avaView: CGFloat = 78 // почему 78?
        static let nameLabelFontSize: CGFloat = 20
        static let icomMenuFontSize: CGFloat = 14
        static let menuStackSpacing: CGFloat = 12
    }

    enum Strings {
        static let nameText = "Владимир Макаров"
    }
}

