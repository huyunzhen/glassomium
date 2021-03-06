/*
   Glassomium - web-based TUIO-enabled window manager
   http://www.glassomium.org

   Copyright 2012 The Glassomium Authors

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/
   
#ifndef COLORCHANGEANIMATION_H
#define COLORCHANGEANIMATION_H

#include "stdafx.h"
#include "Animation.h"

class ColorChangeAnimation : public Animation {
public:
	ColorChangeAnimation(float msecs, const sf::Color &targetColor, AnimatedObject *object, void(*animationEndedCallback)(AnimatedObject *), bool alphaOnly);
	virtual ~ColorChangeAnimation();

	virtual void animate();
private:
	sf::Color targetColor;
	float msecs;
	bool alphaOnly;
};

// Derived

class FadeOutAnimation : public ColorChangeAnimation{
public:
	FadeOutAnimation(float msecs, AnimatedObject *object, void(*animationEndedCallback)(AnimatedObject *) = 0, bool alphaOnly = true)
		: ColorChangeAnimation(msecs, sf::Color(255, 255, 255, 0), object, animationEndedCallback, alphaOnly){}
};

class FadeInAnimation : public ColorChangeAnimation{
public:
	FadeInAnimation(float msecs, AnimatedObject *object, void(*animationEndedCallback)(AnimatedObject *) = 0, bool alphaOnly = true)
		: ColorChangeAnimation(msecs, sf::Color(255, 255, 255, 255), object, animationEndedCallback, alphaOnly){}
};
#endif
