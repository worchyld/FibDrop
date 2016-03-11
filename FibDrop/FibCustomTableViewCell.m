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


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.textLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:16];
        self.textLabel.textColor = [UIColor colorWithWhite:0.498 alpha:1.000];

    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
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
