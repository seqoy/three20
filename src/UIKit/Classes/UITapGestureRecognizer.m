/*
 * Copyright (c) 2011, The Iconfactory. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * 3. Neither the name of The Iconfactory nor the names of its contributors may
 *    be used to endorse or promote products derived from this software without
 *    specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE ICONFACTORY BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "UITapGestureRecognizer.h"
#import "UIGestureRecognizerSubclass.h"

@implementation UITapGestureRecognizer
@synthesize numberOfTapsRequired=_numberOfTapsRequired, numberOfTouchesRequired=_numberOfTouchesRequired;

- (id)initWithTarget:(id)target action:(SEL)action
{
    if ((self=[super initWithTarget:target action:action])) {
        _numberOfTapsRequired = 1;
        _numberOfTouchesRequired = 1;
    }
    return self;
}

- (BOOL)canBePreventedByGestureRecognizer:(UIGestureRecognizer *)preventingGestureRecognizer
{
    // this logic is here based on a note in the docs for -canBePreventedByGestureRecognizer:
    // it may not be correct :)
    if ([preventingGestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        return (((UITapGestureRecognizer *)preventingGestureRecognizer).numberOfTapsRequired > self.numberOfTapsRequired);
    } else {
        return [super canBePreventedByGestureRecognizer:preventingGestureRecognizer];
    }
}

- (BOOL)canPreventGestureRecognizer:(UIGestureRecognizer *)preventedGestureRecognizer
{
    // this logic is here based on a note in the docs for -canPreventGestureRecognizer:
    // it may not be correct :)
    if ([preventedGestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        return (((UITapGestureRecognizer *)preventedGestureRecognizer).numberOfTapsRequired <= self.numberOfTapsRequired);
    } else {
        return [super canPreventGestureRecognizer:preventedGestureRecognizer];
    }
}

@end
