//
//  ViewController.swift
//  Project2
//
//  Created by Luis Fernando Mata on 26/10/15.
//  Copyright © 2015 Luis Fernando Mata. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    //Game vars
    var countries = [String]()
    var score = 0
    var correctAnswer = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setUpLayout()
        createCountriesArray()
        setGame()
    }
    
    //Setup methods
    func setGame(){
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
        title = countries[correctAnswer].uppercaseString
        askQuestion()
    }
    
    func setUpLayout(){
        button1.layer.borderWidth = 1.0
        button1.layer.borderColor = UIColor.lightGrayColor().CGColor
        button2.layer.borderWidth = 1.0
        button2.layer.borderColor = UIColor.lightGrayColor().CGColor
        button3.layer.borderWidth = 1.0
        button3.layer.borderColor = UIColor.lightGrayColor().CGColor
    }
    
    func createCountriesArray(){
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
    }
    
    //Game methods
    func askQuestion(){
        button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        button3.setImage(UIImage(named: countries[2]), forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func flagSelected(sender: AnyObject) {
        var userResult : String
        if sender.tag == correctAnswer {
            userResult = "Correct"
            score++
        }else {
            userResult = "Wrong"
            score--
        }
        
        //This was part of the original tutorial
        /*
        let alertController = UIAlertController(title: userResult, message: "Your score is \(score).", preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "Continue", style: .Default) { (UIAlertAction) -> Void in
            self.setGame()
        }
        alertController.addAction(defaultAction)
        presentViewController(alertController, animated: true, completion: nil)
        */
        
        scoreLabel.text = "Score: \(score)"
        setGame()
    }

}

