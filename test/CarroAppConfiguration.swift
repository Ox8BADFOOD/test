//
//  CarroAppConfiguration.swift
//  test
//
//  Created by Max on 2021/12/19.
//  Copyright © 2021 Max. All rights reserved.
//

import UIKit

extension ZZAppConfiguration: ZZAppConfig  {
    
    var navBarBackImg: UIImage?{
        UIImage.init(named: "nav_back")
    }
    
    var navBarBackgrondColor: UIColor{
        .white
    }
    
    var navBarBottomLineHidden: Bool{
        true
    }
    
    var controllerBGColor: UIColor{
        .white
    }
    
    var tableViewSeparatorColor: UIColor{
        cellDivideColor!
    }
    
    var mainFont: UIFont{
        DetailFont!
    }
    
    var mainColor: UIColor{
        textColorNormal!
    }
    

}
