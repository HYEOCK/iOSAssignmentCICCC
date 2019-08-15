//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let centerSquare1: UIView = {
        let v = UIView(frame: .zero)
        v.backgroundColor = .blue
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let centerSquare2: UIView = {
        let v = UIView(frame: .zero)
        v.backgroundColor = .blue
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let centerSquare3: UIView = {
        let v = UIView(frame: .zero)
        v.backgroundColor = .blue
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let topRectangle: UIView = {
        let v = UIView(frame: .zero)
        v.backgroundColor = .orange
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let bottomRectangle: UIView = {
        let v = UIView(frame: .zero)
        v.backgroundColor = .purple
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
  
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(mainView)
    view.addSubview(bottomRectangle)
    view.addSubview(centerSquare1)
    view.addSubview(centerSquare2)
    view.addSubview(centerSquare3)
    view.addSubview(topRectangle)
    
    setupLayout()
    
    centerSquare1.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 50).isActive = true
    centerSquare1.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
    centerSquare1.widthAnchor.constraint(equalToConstant: 100).isActive = true
    centerSquare1.heightAnchor.constraint(equalToConstant: 100).isActive = true
    
    centerSquare2.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
    centerSquare2.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
    centerSquare2.widthAnchor.constraint(equalToConstant: 100).isActive = true
    centerSquare2.heightAnchor.constraint(equalToConstant: 100).isActive = true
    
    centerSquare3.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -50).isActive = true
    centerSquare3.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
    centerSquare3.widthAnchor.constraint(equalToConstant: 100).isActive = true
    centerSquare3.heightAnchor.constraint(equalToConstant: 100).isActive = true
    
    topRectangle.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 30).isActive = true
    topRectangle.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -30).isActive = true
    topRectangle.widthAnchor.constraint(equalToConstant: 250).isActive = true
    topRectangle.heightAnchor.constraint(equalToConstant: 70).isActive = true
    
    bottomRectangle.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -30).isActive = true
    bottomRectangle.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -40).isActive = true
    bottomRectangle.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.7).isActive = true
    bottomRectangle.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
  }

  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}

