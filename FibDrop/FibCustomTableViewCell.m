//
//  FibCustomTableViewCell.m
//  FibDrop
//
//  Created by Amarjit on 11/03/2016.
//  Copyright © 2016 Amarjit. All rights reserved.
//

#import "FibCustomTableViewCell.h"

NSString *const FibSegmentCellReuseID = @"fibCellReuseId";

@implementation FibCustomTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.textLabel.font = [UIFont fontWithName:@"Georgia" size:16];
}

- (void) prepareForReuse
{
    [super prepareForReuse];
}

- (void) layoutSubviews
{
    [super layoutSubviews];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


@end
