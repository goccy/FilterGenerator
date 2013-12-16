//
//  FilterTypeDelclare.m
//  FilterGenerator
//
//  Created by masaaki goshima on 2013/12/10.
//  Copyright (c) 2013年 masaaki goshima. All rights reserved.
//

#import "FilterTypeDelclare.h"
#import "ContrastFilterView.h"
#import "BrightnessFilterView.h"

GPUImageFilter *contrastFilter(NSNumber *contrast);
UIView *contrastView(EditViewController *);
GPUImageFilter *brightnessFilter(NSNumber *brightness);
UIView *brightnessView(EditViewController *);

FilterInformation filterDeclare[] = {
    {GPUIMAGE_SATURATION,                 "SATURATION",                  false, NULL, NULL},
    {GPUIMAGE_CONTRAST,                   "CONTRAST",                    true, contrastView, contrastFilter},
    {GPUIMAGE_BRIGHTNESS,                 "BRIGHTNESS",                  true, brightnessView, brightnessFilter},
    {GPUIMAGE_LEVELS,                     "LEVELS",                      false, NULL, NULL},
    {GPUIMAGE_EXPOSURE,                   "EXPOSURE",                    false, NULL, NULL},
    {GPUIMAGE_RGB,                        "RGB",                         false, NULL, NULL},
    {GPUIMAGE_HUE,                        "HUE",                         false, NULL, NULL},
    {GPUIMAGE_WHITEBALANCE,               "WHITEBALANCE",                false, NULL, NULL},
    {GPUIMAGE_MONOCHROME,                 "MONOCHROME",                  false, NULL, NULL},
    {GPUIMAGE_FALSECOLOR,                 "FALSECOLOR",                  false, NULL, NULL},
    {GPUIMAGE_SHARPEN,                    "SHARPEN",                     false, NULL, NULL},
    {GPUIMAGE_UNSHARPMASK,                "UNSHARPMASK",                 false, NULL, NULL},
    {GPUIMAGE_TRANSFORM,                  "TRANSFORM",                   false, NULL, NULL},
    {GPUIMAGE_TRANSFORM3D,                "TRANSFORM3D",                 false, NULL, NULL},
    {GPUIMAGE_CROP,                       "CROP",                        false, NULL, NULL},
	{GPUIMAGE_MASK,                       "MASK",                        false, NULL, NULL},
    {GPUIMAGE_GAMMA,                      "GAMMA",                       false, NULL, NULL},
    {GPUIMAGE_TONECURVE,                  "TONECURVE",                   false, NULL, NULL},
    {GPUIMAGE_HIGHLIGHTSHADOW,            "HIGHLIGHT SHADOW",            false, NULL, NULL},
    {GPUIMAGE_HAZE,                       "HAZE",                        false, NULL, NULL},
    {GPUIMAGE_SEPIA,                      "SEPIA",                       false, NULL, NULL},
    {GPUIMAGE_AMATORKA,                   "AMATORKA",                    false, NULL, NULL},
    {GPUIMAGE_MISSETIKATE,                "MISSETIAKTE",                 false, NULL, NULL},
    {GPUIMAGE_SOFTELEGANCE,               "SOFT ELEGANCE",               false, NULL, NULL},
    {GPUIMAGE_COLORINVERT,                "COLOR INVERT",                false, NULL, NULL},
    {GPUIMAGE_GRAYSCALE,                  "GRAY SCALE",                  false, NULL, NULL},
    {GPUIMAGE_HISTOGRAM,                  "HISTOGRAM",                   false, NULL, NULL},
    {GPUIMAGE_AVERAGECOLOR,               "AVERAGE COLOR",               false, NULL, NULL},
    {GPUIMAGE_LUMINOSITY,                 "LUMINOSITY",                  false, NULL, NULL},
    {GPUIMAGE_THRESHOLD,                  "THRESHOLD",                   false, NULL, NULL},
    {GPUIMAGE_ADAPTIVETHRESHOLD,          "ADAPTIVE THRESHOLD",          false, NULL, NULL},
    {GPUIMAGE_AVERAGELUMINANCETHRESHOLD,  "AVERAGE LUMINANCE THRESHOLD", false, NULL, NULL},
    {GPUIMAGE_PIXELLATE,                  "PIXELLATE",                   false, NULL, NULL},
    {GPUIMAGE_POLARPIXELLATE,             "POLARPIXELLATE",              false, NULL, NULL},
    {GPUIMAGE_PIXELLATE_POSITION,         "PIXELLATE POSITION",          false, NULL, NULL},
    {GPUIMAGE_POLKADOT,                   "POLKADOT",                    false, NULL, NULL},
    {GPUIMAGE_HALFTONE,                   "HALF TONE",                   false, NULL, NULL},
    {GPUIMAGE_CROSSHATCH,                 "CROSS HATCH",                 false, NULL, NULL},
    {GPUIMAGE_SOBELEDGEDETECTION,         "SOBEL EDGE DETECTION",        false, NULL, NULL},
    {GPUIMAGE_PREWITTEDGEDETECTION,       "PREWITT EDGE DETECTION",      false, NULL, NULL},
    {GPUIMAGE_CANNYEDGEDETECTION,         "CANNY EDGE DETECTION",        false, NULL, NULL},
    {GPUIMAGE_THRESHOLDEDGEDETECTION,     "THRESHOLD EDGE DETECTION",    false, NULL, NULL},
    {GPUIMAGE_XYGRADIENT,                 "XY GRADIENT",                 false, NULL, NULL},
    {GPUIMAGE_HARRISCORNERDETECTION,      "HARRIS CORNER DETECTION",     false, NULL, NULL},
    {GPUIMAGE_NOBLECORNERDETECTION,       "NOBLE CORNER DETECTION",      false, NULL, NULL},
    {GPUIMAGE_SHITOMASIFEATUREDETECTION,  "SHITOMASIFEATURE DETECTION",  false, NULL, NULL},
    {GPUIMAGE_HOUGHTRANSFORMLINEDETECTOR, "HOUGHTRANSFORMLINEDETECTOR",  false, NULL, NULL},
    {GPUIMAGE_BUFFER,                     "BUFFER",                      false, NULL, NULL},
    {GPUIMAGE_LOWPASS,                    "LOWPASS",                     false, NULL, NULL},
    {GPUIMAGE_HIGHPASS,                   "HIGHPASS",                    false, NULL, NULL},
    {GPUIMAGE_MOTIONDETECTOR,             "MOTION DETECTOR",             false, NULL, NULL},
    {GPUIMAGE_SKETCH,                     "SKETCH",                      false, NULL, NULL},
    {GPUIMAGE_THRESHOLDSKETCH,            "THRESHOLD SKETCH",            false, NULL, NULL},
    {GPUIMAGE_TOON,                       "TOON",                        false, NULL, NULL},
    {GPUIMAGE_SMOOTHTOON,                 "SMOOTH TOON",                 false, NULL, NULL},
    {GPUIMAGE_TILTSHIFT,                  "TILT SHIFT",                  false, NULL, NULL},
    {GPUIMAGE_CGA,                        "CGA",                         false, NULL, NULL},
    {GPUIMAGE_POSTERIZE,                  "POSTERIZE",                   false, NULL, NULL},
    {GPUIMAGE_CONVOLUTION,                "CONVOLUTION",                 false, NULL, NULL},
    {GPUIMAGE_EMBOSS,                     "EMBOSS",                      false, NULL, NULL},
    {GPUIMAGE_LAPLACIAN,                  "LAPLACIAN",                   false, NULL, NULL},
    {GPUIMAGE_CHROMAKEYNONBLEND,          "CHROMAKEY NON BLEND",         false, NULL, NULL},
    {GPUIMAGE_KUWAHARA,                   "KUWAHARA",                    false, NULL, NULL},
    {GPUIMAGE_KUWAHARARADIUS3,            "KUWAHARA RADIUS3",            false, NULL, NULL},
    {GPUIMAGE_VIGNETTE,                   "VIGNETTE",                    false, NULL, NULL},
    {GPUIMAGE_GAUSSIAN,                   "GAUSSIAN",                    false, NULL, NULL},
    {GPUIMAGE_GAUSSIAN_SELECTIVE,         "GAUSSIAN SELECTIVE",          false, NULL, NULL},
    {GPUIMAGE_GAUSSIAN_POSITION,          "GAUSSIAN POSITION",           false, NULL, NULL},
    {GPUIMAGE_FASTBLUR,                   "FAST BLUR",                   false, NULL, NULL},
    {GPUIMAGE_BOXBLUR,                    "BOX BLUR",                    false, NULL, NULL},
    {GPUIMAGE_MEDIAN,                     "MEDIAN",                      false, NULL, NULL},
    {GPUIMAGE_BILATERAL,                  "BILATERNAL",                  false, NULL, NULL},
    {GPUIMAGE_MOTIONBLUR,                 "MOTION BLUR",                 false, NULL, NULL},
    {GPUIMAGE_ZOOMBLUR,                   "ZOOM BLUR",                   false, NULL, NULL},
    {GPUIMAGE_SWIRL,                      "SWIRL",                       false, NULL, NULL},
    {GPUIMAGE_BULGE,                      "BULGE",                       false, NULL, NULL},
    {GPUIMAGE_PINCH,                      "PINCH",                       false, NULL, NULL},
    {GPUIMAGE_SPHEREREFRACTION,           "SPHERE REFRACTION",           false, NULL, NULL},
    {GPUIMAGE_GLASSSPHERE,                "GLASS SPHERE",                false, NULL, NULL},
    {GPUIMAGE_STRETCH,                    "STRETCH",                     false, NULL, NULL},
    {GPUIMAGE_DILATION,                   "DILATION",                    false, NULL, NULL},
    {GPUIMAGE_EROSION,                    "EROSION",                     false, NULL, NULL},
    {GPUIMAGE_OPENING,                    "OPENING",                     false, NULL, NULL},
    {GPUIMAGE_CLOSING,                    "CLOSING",                     false, NULL, NULL},
    {GPUIMAGE_PERLINNOISE,                "PERLINNOISE",                 false, NULL, NULL},
    {GPUIMAGE_VORONOI,                    "VORONOI",                     false, NULL, NULL},
    {GPUIMAGE_MOSAIC,                     "MOSAIC",                      false, NULL, NULL},
    {GPUIMAGE_LOCALBINARYPATTERN,         "LOCAL BINARY PATTERN",        false, NULL, NULL},
    {GPUIMAGE_DISSOLVE,                   "DISSOLVE",                    false, NULL, NULL},
    {GPUIMAGE_CHROMAKEY,                  "CHROMAKEY",                   false, NULL, NULL},
    {GPUIMAGE_ADD,                        "ADD",                         false, NULL, NULL},
    {GPUIMAGE_DIVIDE,                     "DIVIDE",                      false, NULL, NULL},
    {GPUIMAGE_MULTIPLY,                   "MULTIPLY",                    false, NULL, NULL},
    {GPUIMAGE_OVERLAY,                    "OVERLAY",                     false, NULL, NULL},
    {GPUIMAGE_LIGHTEN,                    "LIGHTEN",                     false, NULL, NULL},
    {GPUIMAGE_DARKEN,                     "DARKEN",                      false, NULL, NULL},
    {GPUIMAGE_COLORBURN,                  "COLOR BURN",                  false, NULL, NULL},
    {GPUIMAGE_COLORDODGE,                 "COLOR DODGE",                 false, NULL, NULL},
    {GPUIMAGE_LINEARBURN,                 "LINEAR BURN",                 false, NULL, NULL},
    {GPUIMAGE_SCREENBLEND,                "SCREEN BLEND",                false, NULL, NULL},
    {GPUIMAGE_DIFFERENCEBLEND,            "DIFFERENCE BLEND",            false, NULL, NULL},
	{GPUIMAGE_SUBTRACTBLEND,              "SUBTRACT BLEND",              false, NULL, NULL},
    {GPUIMAGE_EXCLUSIONBLEND,             "EXCLUSION BLEND",             false, NULL, NULL},
    {GPUIMAGE_HARDLIGHTBLEND,             "HARD LIGHT BLEND",            false, NULL, NULL},
    {GPUIMAGE_SOFTLIGHTBLEND,             "SOFT LIGHT BLEND",            false, NULL, NULL},
    {GPUIMAGE_COLORBLEND,                 "COLOR BLEND",                 false, NULL, NULL},
    {GPUIMAGE_HUEBLEND,                   "HUE BLEND",                   false, NULL, NULL},
    {GPUIMAGE_SATURATIONBLEND,            "SATURATION BLEND",            false, NULL, NULL},
    {GPUIMAGE_LUMINOSITYBLEND,            "LUMINOSITY BLEND",            false, NULL, NULL},
    {GPUIMAGE_NORMALBLEND,                "NORMAL BLEND",                false, NULL, NULL},
    {GPUIMAGE_POISSONBLEND,               "POISSON BLEND",               false, NULL, NULL},
    {GPUIMAGE_OPACITY,                    "OPACITY",                     false, NULL, NULL},
    {GPUIMAGE_CUSTOM,                     "CUSTOM",                      false, NULL, NULL},
    {GPUIMAGE_UIELEMENT,                  "UIELEMENT",                   false, NULL, NULL},
    {GPUIMAGE_FILECONFIG,                 "FILE CONFIG",                 false, NULL, NULL},
    {GPUIMAGE_FILTERGROUP,                "FILTER GROUP",                false, NULL, NULL},
    {GPUIMAGE_FACES,                      "FACES",                       false, NULL, NULL},
    {GPUIMAGE_NUMFILTERS,                 "NUMFILTERS",                  false, NULL, NULL},
    {GPUIMAGE_END_FILTER,                 "",                            false, NULL, NULL}
};

FilterMethod getFilterMethod(const char *filterName)
{
    for (size_t i = 0; i < GPUIMAGE_END_FILTER; i++) {
        const char *name = filterDeclare[i].name;
        size_t fromLen = strlen(filterName);
        size_t toLen   = strlen(name);
        if (fromLen == toLen && !strncmp(name, filterName, fromLen)) {
            return (FilterMethod)filterDeclare[i].filter;
        }
    }
    return nil;
}

GPUImageFilter *contrastFilter(NSNumber *contrastValue)
{
    float contrast = [contrastValue floatValue];
    GPUImageContrastFilter *contrastFilter = [[GPUImageContrastFilter alloc] init];
    [contrastFilter setContrast:contrast];
    return contrastFilter;
}

UIView *contrastView(EditViewController *editVC)
{
    return [[ContrastFilterView alloc] initWithEditViewController:editVC];
}

GPUImageFilter *brightnessFilter(NSNumber *brightnessValue)
{
    float brightness = [brightnessValue floatValue];
    GPUImageBrightnessFilter *brightnessFilter = [[GPUImageBrightnessFilter alloc] init];
    [brightnessFilter setBrightness:brightness];
    return brightnessFilter;
}

UIView *brightnessView(EditViewController *editVC)
{
    return [[BrightnessFilterView alloc] initWithEditViewController:editVC];
}
