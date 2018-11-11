#!/bin/bash

sudo pacman -S --noconfirm --needed \
	adobe-source-han-sans-otc-fonts \
	adobe-source-han-serif-otc-fonts \
	arc-gtk-theme \
	compton
	feh \
	i3 \
	lxappearance \
	pavucontrol \
	perl-anyevent-i3 \
	playerctl \
	pulseaudio \
	rofi \
	termite \
	thunar \
	xorg-server \
	xorg-xprop

aura -Aa --noconfirm --needed \
	font-mathematica \
	moka-icon-theme \
	system-san-francisco-font-git \
	ttf-ancient-fonts \
	ttf-arabeyes-fonts \
	ttf-roboto-mono
