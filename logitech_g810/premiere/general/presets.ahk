; Uses preset.ahk to assign presets
#Include preset.ahk

TransitionDipToBlack() {
  addTransition("Dip To Black")
}

AudioTransitionExponetialFade() {
  addTransition("Exponential Fade")
}
AudioTransitionConstantPower() {
  addTransition("Constant Power")
}

EffectUltraKey() {
  preset("Ultra Key")
}

EffectColorKey() {
  preset("AHK Color Key")
}

EffectHorizontalFlip() {
  preset("Horizontal Flip")
}

EffectCrop() {
  preset("Crop")
}

EffectCameraBlur() {
  preset("Camera Blur")
}
EffectWarpStable() {
  preset("Warp Stab")
}