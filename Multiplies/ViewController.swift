//
//  ViewController.swift
//  Multiplies
//
//  Created by Salih Hajlakovic on 22/02/16.
//  Copyright © 2016 Salih Hajlakovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var imgViewMultiples: UIImageView!
    @IBOutlet weak var lblAdd: UILabel!
    @IBOutlet weak var txtAdd: UITextField!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    
    //Variables
    var tempRes = 0
    var add = 0
    var maxResult = 0
    var isFirstIteration = true
    
    let lblText = "Press Add to add!"
    let txtPlaceholderText = "What multiple to add by?"
    
    //Actions
    
    @IBAction func Play(sender: UIButton) {
        setVisibility(true)
        setEquation()
    }
    
    @IBAction func Add(sender: UIButton)
    {
        setEquation()
    }
    
    func setVisibility(isVisible: Bool)
    {
        imgViewMultiples.hidden = isVisible
        txtAdd.hidden = isVisible
        btnPlay.hidden = isVisible
    
        lblAdd.hidden = !isVisible
        btnAdd.hidden = !isVisible
    }
    
    func setEquation()
    {
        if(tempRes < maxResult || isFirstIteration)
        {
            if (isFirstIteration){
                add = Int(txtAdd.text!)!
                maxResult = add * add
                isFirstIteration = false
            }
        
            lblAdd.text = "\(tempRes) + \(add) = \(tempRes + add)"
            tempRes += add
        }
        else
        {
            ResetGame()
        }
    }
    
    func ResetGame()
    {
        resetScoresAndText()
        setVisibility(false)
    }
    
    func resetScoresAndText()
    {
        txtAdd.placeholder = txtPlaceholderText
        txtAdd.text = ""
        lblAdd.text = lblText
        
        tempRes = 0
        add = 0
        maxResult = 0
        isFirstIteration = true
    }

}

