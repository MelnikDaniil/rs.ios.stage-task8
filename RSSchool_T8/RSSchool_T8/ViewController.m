#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>



//new colors
@interface UIColor (CustomColors)
+(UIColor * _Nullable) LightGreenSea;
+(UIColor * _Nullable) ChillSky;
+(UIColor * _Nullable) rsBlack;
+(UIColor * _Nullable) rsWhite;
@end

//implementation of new colors
@implementation UIColor (CustomColors)
+(UIColor * _Nullable) LightGreenSea   { return [UIColor colorWithRed:0.13 green:0.692 blue:0.557 alpha:1.0]; }
+(UIColor * _Nullable) ChillSky        { return [UIColor colorWithRed:0.0 green:0.7 blue:1.0 alpha:1.0]; }
+(UIColor * _Nullable) rsBlack         { return [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0]; }
+(UIColor * _Nullable) rsWhite         { return [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]; }
@end



@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *openPaletteButton;
@property (weak, nonatomic) IBOutlet UIButton *openTimerButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *drawButton;
@property (weak, nonatomic) IBOutlet UINavigationItem *artistNavigationTitle;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *drawingsButton;
@property (weak, nonatomic) IBOutlet UIView *drawingView;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;

@end


@implementation ViewController

- (void)viewDidLoad {
   
    
    [super viewDidLoad];
    
    //Drawing View Customizing
    self.drawingView.layer.cornerRadius = 8.0;
    _drawingView.layer.shadowRadius  = 4.0;
    _drawingView.layer.shadowColor   = [UIColor colorWithRed:0.f/255.f green:178.f/255.f blue:255.f/255.f alpha:0.25f].CGColor;
    _drawingView.layer.shadowOffset  = CGSizeMake(0.0, 0.0);
    _drawingView.layer.shadowOpacity = 0.9;
    _drawingView.layer.masksToBounds = NO;
    UIEdgeInsets shadowInsets     = UIEdgeInsetsMake(0, 0, -1.0, 0);
    UIBezierPath *shadowPath      = [UIBezierPath bezierPathWithRect:UIEdgeInsetsInsetRect(_drawingView.bounds, shadowInsets)];
    _drawingView.layer.shadowPath    = shadowPath.CGPath;
    
    
    
    //Palette Button Customizing
    self.openPaletteButton.layer.cornerRadius = 10;
    [self.openPaletteButton setTitleColor:UIColor.LightGreenSea forState:UIControlStateNormal];
    self.openPaletteButton.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18.0];
    //shadows
    [self.openPaletteButton.layer setShadowColor:[UIColor lightGrayColor].CGColor];
    [self.openPaletteButton.layer setShadowOpacity:0.8];
    [self.openPaletteButton.layer setShadowRadius:1.0];
    [self.openPaletteButton.layer setShadowOffset:CGSizeMake(0.0,0.0)];
    self.openPaletteButton.layer.masksToBounds = NO;

   
    
    //Timer Button Customizing
    self.openTimerButton.layer.cornerRadius = 10;
    [self.openTimerButton setTitleColor:UIColor.LightGreenSea forState:UIControlStateNormal];
    self.openTimerButton.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18.0];
    //shadows
    [self.openTimerButton.layer setShadowColor:[UIColor lightGrayColor].CGColor];
    [self.openTimerButton.layer setShadowOpacity:0.8];
    [self.openTimerButton.layer setShadowRadius:1.0];
    [self.openTimerButton.layer setShadowOffset:CGSizeMake(0.0,0.0)];
    self.openTimerButton.layer.masksToBounds = NO;

    
    
    //Reset Button Customizing
    self.resetButton.layer.cornerRadius = 10;
    [self.resetButton setTitleColor:UIColor.LightGreenSea forState:UIControlStateNormal];
    self.resetButton.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18.0];
    //shadows
    [self.resetButton.layer setShadowColor:[UIColor lightGrayColor].CGColor];
    [self.resetButton.layer setShadowOpacity:0.8];
    [self.resetButton.layer setShadowRadius:1.0];
    [self.resetButton.layer setShadowOffset:CGSizeMake(0.0,0.0)];
    self.resetButton.layer.masksToBounds = NO;
    self.resetButton.hidden = YES;
    
    //button actions
    
   [self.resetButton addTarget:self
                            action:@selector(resetButtonTapped:)
                  forControlEvents:(UIControlEventTouchUpInside)];

    //Draw Button Customizing
    self.drawButton.layer.cornerRadius = 10;
    [self.drawButton setTitleColor:UIColor.LightGreenSea forState:UIControlStateNormal];
    self.drawButton.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18.0];
    //shadows
    [self.drawButton.layer setShadowColor:[UIColor lightGrayColor].CGColor];
    [self.drawButton.layer setShadowOpacity:0.8];
    [self.drawButton.layer setShadowRadius:1.0];
    [self.drawButton.layer setShadowOffset:CGSizeMake(0.0,0.0)];
    self.drawButton.layer.masksToBounds = NO;
    
    //button actions
    
   [self.drawButton addTarget:self
                            action:@selector(drawButtonTapped:)
                  forControlEvents:(UIControlEventTouchUpInside)];
    
    
    
    //Share Button Customizing
    self.shareButton.layer.cornerRadius = 10;
    [self.shareButton setTitleColor:UIColor.LightGreenSea forState:UIControlStateNormal];
    self.shareButton.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18.0];
    //shadows
    [self.shareButton.layer setShadowColor:[UIColor lightGrayColor].CGColor];
    [self.shareButton.layer setShadowOpacity:0.8];
    [self.shareButton.layer setShadowRadius:1.0];
    [self.shareButton.layer setShadowOffset:CGSizeMake(0.0,0.0)];
    self.shareButton.layer.masksToBounds = NO;
    self.shareButton.enabled = NO;
    self.shareButton.alpha = 0.5;
    
    
    
    //Navigation Bar Tuning
    
    self.navigationController.navigationBar.tintColor = [UIColor LightGreenSea];
    
    [_drawingsButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
        [UIFont fontWithName:@"Montserrat-Medium" size:17.0], NSFontAttributeName,
        nil] forState:UIControlStateNormal];
    [_drawingsButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
        [UIFont fontWithName:@"Montserrat-Medium" size:17.0], NSFontAttributeName,
        nil] forState:UIControlStateHighlighted];
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor rsBlack],
       NSFontAttributeName:[UIFont fontWithName:@"Montserrat-Medium" size:17]}];
    
}

-(void) drawButtonTapped:(UIButton *) sender {
    
    if (self.drawButton.hidden == YES && self.resetButton.hidden == NO) {
        self.drawButton.hidden = NO;
        self.resetButton.hidden = YES;
    } else if (self.drawButton.hidden == NO && self.resetButton.hidden == YES){
        self.shareButton.enabled = YES;
        self.shareButton.alpha = 1.0;
        self.openPaletteButton.enabled = NO;
        self.openPaletteButton.alpha = 0.5;
        self.openTimerButton.enabled = NO;
        self.openTimerButton.alpha = 0.5;
        
        CAShapeLayer *headLayer1 = [CAShapeLayer layer];
        headLayer1.bounds = CGRectMake(-180, -180, 300, 300);
        
        UIBezierPath* bezierPath1 = [UIBezierPath bezierPath];
        [bezierPath1 moveToPoint: CGPointMake(31.5, 0)];
        [bezierPath1 addLineToPoint: CGPointMake(47, 60)];
        [bezierPath1 addLineToPoint: CGPointMake(59, 83)];
        [bezierPath1 addLineToPoint: CGPointMake(76.5, 102.5)];
        [bezierPath1 addLineToPoint: CGPointMake(103.5, 125)];
        [bezierPath1 addLineToPoint: CGPointMake(127, 130.5)];
        [bezierPath1 addLineToPoint: CGPointMake(163, 113)];
        [bezierPath1 addLineToPoint: CGPointMake(190, 83)];
        [bezierPath1 addLineToPoint: CGPointMake(198.5, 71)];
        [bezierPath1 addLineToPoint: CGPointMake(198.5, 48.5)];
        [bezierPath1 addLineToPoint: CGPointMake(200.5, 21.5)];
        [bezierPath1 addLineToPoint: CGPointMake(188.5, 11.5)];
        [bezierPath1 addLineToPoint: CGPointMake(172, 14.5)];
        [bezierPath1 addLineToPoint: CGPointMake(161, 31.5)];
        [bezierPath1 addLineToPoint: CGPointMake(159, 54.5)];
        [bezierPath1 addLineToPoint: CGPointMake(163, 67)];
        bezierPath1.lineWidth = 1;
        [headLayer1 setStrokeColor:UIColor.blackColor.CGColor];
        [headLayer1 setPath:bezierPath1.CGPath];
        [headLayer1 setFillColor:nil];
        [headLayer1 setStrokeStart:0.0];
        [headLayer1 setStrokeEnd:1.0];
        
        [[self.drawingView layer] addSublayer:headLayer1];
        
        
        
        CAShapeLayer *headLayer2 = [CAShapeLayer layer];
        headLayer2.bounds = CGRectMake(-104, -208, 300, 300);
        
        UIBezierPath* bezierPath2 = [UIBezierPath bezierPath];
        [bezierPath2 moveToPoint: CGPointMake(230, 45)];
        [bezierPath2 addLineToPoint: CGPointMake(221.5, 43.5)];
        [bezierPath2 addLineToPoint: CGPointMake(212, 45.5)];
        [bezierPath2 addLineToPoint: CGPointMake(204, 46.5)];
        [bezierPath2 addLineToPoint: CGPointMake(194.5, 45.5)];
        [bezierPath2 addLineToPoint: CGPointMake(186, 44)];
        [bezierPath2 addLineToPoint: CGPointMake(179.5, 43.5)];
        [bezierPath2 addLineToPoint: CGPointMake(172, 45)];
        [bezierPath2 addLineToPoint: CGPointMake(167.5, 47)];
        [bezierPath2 addLineToPoint: CGPointMake(173.5, 49.5)];
        [bezierPath2 addLineToPoint: CGPointMake(178, 53)];
        [bezierPath2 addLineToPoint: CGPointMake(182.5, 58)];
        [bezierPath2 addLineToPoint: CGPointMake(188.5, 60.5)];
        [bezierPath2 addLineToPoint: CGPointMake(196, 61.5)];
        [bezierPath2 addLineToPoint: CGPointMake(203, 60.5)];
        [bezierPath2 addLineToPoint: CGPointMake(210.5, 61.5)];
        [bezierPath2 addLineToPoint: CGPointMake(216.5, 60.5)];
        [bezierPath2 addLineToPoint: CGPointMake(223, 56.5)];
        [bezierPath2 addLineToPoint: CGPointMake(230, 48.5)];
        [bezierPath2 addLineToPoint: CGPointMake(234.5, 42.5)];
        [bezierPath2 addLineToPoint: CGPointMake(226.5, 41.5)];
        [bezierPath2 addLineToPoint: CGPointMake(217.5, 40.5)];
        [bezierPath2 addLineToPoint: CGPointMake(208.5, 38.5)];
        [bezierPath2 addLineToPoint: CGPointMake(200, 38)];
        [bezierPath2 addLineToPoint: CGPointMake(190, 39.5)];
        [bezierPath2 addLineToPoint: CGPointMake(181, 41.5)];
        [bezierPath2 addLineToPoint: CGPointMake(171, 42.5)];
        [bezierPath2 addLineToPoint: CGPointMake(164, 42)];
        [bezierPath2 addLineToPoint: CGPointMake(173.5, 36)];
        [bezierPath2 addLineToPoint: CGPointMake(182.5, 29.5)];
        [bezierPath2 addLineToPoint: CGPointMake(188.5, 26)];
        [bezierPath2 addLineToPoint: CGPointMake(193.5, 27.5)];
        [bezierPath2 addLineToPoint: CGPointMake(199, 29.5)];
        [bezierPath2 addLineToPoint: CGPointMake(205.5, 28.5)];
        [bezierPath2 addLineToPoint: CGPointMake(212, 27.5)];
        [bezierPath2 addLineToPoint: CGPointMake(217.5, 27.5)];
        [bezierPath2 addLineToPoint: CGPointMake(220.5, 29.5)];
        [bezierPath2 addLineToPoint: CGPointMake(225.5, 34.5)];
        [bezierPath2 addLineToPoint: CGPointMake(233, 39)];
        bezierPath2.lineWidth = 1;
        [headLayer2 setStrokeColor:UIColor.blackColor.CGColor];
        [headLayer2 setPath:bezierPath2.CGPath];
        [headLayer2 setFillColor:nil];
        [headLayer2 setStrokeStart:0.0];
        [headLayer2 setStrokeEnd:1.0];
        
        [[self.drawingView layer] addSublayer:headLayer2];
        
        
        
        CAShapeLayer *headLayer3 = [CAShapeLayer layer];
        headLayer3.bounds = CGRectMake(-178, -253, 300, 300);
        
        UIBezierPath* bezierPath3 = [UIBezierPath bezierPath];
        [bezierPath3 moveToPoint: CGPointMake(161.5, 1.5)];
        [bezierPath3 addLineToPoint: CGPointMake(166, 7.5)];
        [bezierPath3 addLineToPoint: CGPointMake(168.5, 14)];
        [bezierPath3 addLineToPoint: CGPointMake(165, 23)];
        [bezierPath3 addLineToPoint: CGPointMake(158, 31.5)];
        [bezierPath3 addLineToPoint: CGPointMake(149, 38.5)];
        [bezierPath3 addLineToPoint: CGPointMake(139.5, 31.5)];
        [bezierPath3 addLineToPoint: CGPointMake(129, 27.5)];
        [bezierPath3 addLineToPoint: CGPointMake(119.5, 27.5)];
        [bezierPath3 addLineToPoint: CGPointMake(107.5, 31.5)];
        [bezierPath3 addLineToPoint: CGPointMake(99.5, 41)];
        [bezierPath3 addLineToPoint: CGPointMake(93, 53.5)];
        [bezierPath3 addLineToPoint: CGPointMake(81.5, 46.5)];
        [bezierPath3 addLineToPoint: CGPointMake(73.5, 36.5)];
        [bezierPath3 addLineToPoint: CGPointMake(65, 27.5)];
        [bezierPath3 addLineToPoint: CGPointMake(65, 41)];
        [bezierPath3 addLineToPoint: CGPointMake(65, 69.5)];
        [bezierPath3 addLineToPoint: CGPointMake(65, 86.5)];
        [bezierPath3 addLineToPoint: CGPointMake(58, 98)];
        [bezierPath3 addLineToPoint: CGPointMake(46.5, 106.5)];
        [bezierPath3 addLineToPoint: CGPointMake(35.5, 113.5)];
        [bezierPath3 addLineToPoint: CGPointMake(53, 120)];
        [bezierPath3 addLineToPoint: CGPointMake(66.5, 128.5)];
        [bezierPath3 addLineToPoint: CGPointMake(77, 142.5)];
        [bezierPath3 addLineToPoint: CGPointMake(91, 160)];
        [bezierPath3 addLineToPoint: CGPointMake(110, 178)];
        [bezierPath3 addLineToPoint: CGPointMake(129, 184.5)];
        [bezierPath3 addLineToPoint: CGPointMake(143, 184.5)];
        [bezierPath3 addLineToPoint: CGPointMake(158, 176.5)];
        [bezierPath3 addLineToPoint: CGPointMake(171.5, 160)];
        [bezierPath3 addLineToPoint: CGPointMake(181.5, 138.5)];
        [bezierPath3 addLineToPoint: CGPointMake(191, 122.5)];
        [bezierPath3 addLineToPoint: CGPointMake(205.5, 116)];
        [bezierPath3 addLineToPoint: CGPointMake(209, 116)];
        [bezierPath3 addLineToPoint: CGPointMake(202.5, 100.5)];
        [bezierPath3 addLineToPoint: CGPointMake(193, 72)];
        [bezierPath3 addLineToPoint: CGPointMake(191, 49)];
        [bezierPath3 addLineToPoint: CGPointMake(191, 25.5)];
        [bezierPath3 addLineToPoint: CGPointMake(184, 36.5)];
        [bezierPath3 addLineToPoint: CGPointMake(176, 44.5)];
        [bezierPath3 addLineToPoint: CGPointMake(168.5, 53.5)];
        [bezierPath3 addLineToPoint: CGPointMake(152, 69.5)];
        [bezierPath3 addLineToPoint: CGPointMake(142, 84)];
        [bezierPath3 addLineToPoint: CGPointMake(133.5, 105.5)];
        [bezierPath3 addLineToPoint: CGPointMake(130.5, 131.5)];
        [bezierPath3 addLineToPoint: CGPointMake(130.5, 160)];
        [bezierPath3 addLineToPoint: CGPointMake(130.5, 178)];
        bezierPath3.lineWidth = 1;
        [headLayer3 setStrokeColor:UIColor.blackColor.CGColor];
        [headLayer3 setPath:bezierPath3.CGPath];
        [headLayer3 setFillColor:nil];
        [headLayer3 setStrokeStart:0.0];
        [headLayer3 setStrokeEnd:1.0];
     
        [[self.drawingView layer] addSublayer:headLayer3];
        
        
        self.drawButton.hidden = YES;
        self.resetButton.hidden = NO;
    }
}

-(void) resetButtonTapped:(UIButton *) sender {
    
    if (self.drawButton.hidden == YES && self.resetButton.hidden == NO) {
        CAShapeLayer *circleLayer = [CAShapeLayer layer];
        [circleLayer setPath:[[UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 300, 300)] CGPath]];
        [circleLayer setFillColor:[[UIColor rsWhite] CGColor]];
        [[self.drawingView layer] addSublayer:circleLayer];
        self.drawButton.hidden = NO;
        self.resetButton.hidden = YES;
        self.openPaletteButton.enabled = YES;
        self.openPaletteButton.alpha = 1.0;
        self.openTimerButton.enabled = YES;
        self.openTimerButton.alpha = 1.0;
        self.shareButton.enabled = NO;
        self.shareButton.alpha = 0.5;
    }
}

- (IBAction)planetButton:(id)sender {
}
@end
