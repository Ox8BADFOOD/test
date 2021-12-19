//
//  ZZFont.m
//  ShareBeauty
//
//  Created by Max on 2020/12/22.
//  Copyright © 2020 GaoLian. All rights reserved.
//

#import "ZZFont.h"

UIFont * zz_PFFont(CGFloat size){
    return [UIFont fontWithName:PFRegularName size:size];
}

UIFont * zz_PFMediumFont(CGFloat size){
    return [UIFont fontWithName:PFMediumName size:size];
}

UIFont * zz_PFBoldFont(CGFloat size){
    return [UIFont fontWithName:PFSemiboldName size:size];
}

UIFont * zz_Font(CGFloat size){
    return [UIFont systemFontOfSize:size];
}

UIFont * zz_MediumFont(CGFloat size){
    return [UIFont systemFontOfSize:size weight:UIFontWeightMedium];
}

UIFont * zz_BoldFont(CGFloat size){
    return [UIFont systemFontOfSize:size weight:UIFontWeightBold];
}

UIFont * zz_HeavyFont(CGFloat size){
    return [UIFont systemFontOfSize:size weight:UIFontWeightHeavy];
}
