//
//  DiceSelectionVC.swift
//  PlayingDice
//
//  Created by Samed Eryiğit on 18.01.2023.
//

import UIKit

class DiceSelectionVC: UIViewController {
    
    let diceImageView = UIImageView()
    let stopButton    = DWButton(color: .systemRed, title: "Stop!", systemImageName: "stop.circle")
    let resetButton   = DWButton(color: .systemGreen, title: "Reset", systemImageName: "arrow.clockwise.circle")
    let aboutButton   = DWButton(color: .systemBlue, title: "About", systemImageName: "person.crop.square.fill")
    
    var dices: [UIImage] = DiceDect.allValues
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomDice), userInfo: nil, repeats: true)
    }
    
    @objc func stopTimer() {
        timer.invalidate()
    }
    
    @objc func showRandomDice() {
        diceImageView.image = dices.randomElement()
    }
    
    @objc func resetTimer() {
        stopTimer()
        startTimer()
    }
    
    func configureUI(){
        configureDiceImageView()
        configureStopButton()
        configureResetButton()
        configureAboutButton()
    }
    
    func configureDiceImageView() {
        view.addSubview(diceImageView)
        diceImageView.translatesAutoresizingMaskIntoConstraints = false
        diceImageView.image = UIImage(named: "Dice1")
        NSLayoutConstraint.activate([
            diceImageView.widthAnchor.constraint(equalToConstant: 200),
            diceImageView.heightAnchor.constraint(equalToConstant: 200),
            diceImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            diceImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80)
        ])
    }
    
    func configureStopButton() {
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 210),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: diceImageView.bottomAnchor, constant: 30)
        ])
    }
    
    func configureResetButton(){
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 100),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    func configureAboutButton(){
        view.addSubview(aboutButton)
        aboutButton.addTarget(self, action: #selector(presentAboutVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            aboutButton.widthAnchor.constraint(equalToConstant: 100),
            aboutButton.heightAnchor.constraint(equalToConstant: 50),
            aboutButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20),
            aboutButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor)
        ])
    }
    
    @objc func presentAboutVC(){
        present(AboutVC(), animated: true)
    }
    
}
