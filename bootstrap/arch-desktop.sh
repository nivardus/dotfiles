#!/bin/bash

sudo pacman -S --noconfirm --needed \
	adobe-source-han-sans-otc-fonts \
	adobe-source-han-serif-otc-fonts \
	ttf-font-awesome \
	font-mathematica \
	arc-gtk-theme \
	compton \
	feh \
	i3-wm \
	i3status \
	dmenu \
	lxappearance \
	pavucontrol \
	perl-anyevent-i3 \
	playerctl \
	pulseaudio \
	rofi \
	termite \
	thunar \
	xorg-server \
	xorg-xprop \
	xterm \
	xorg-xinit

sudo aura -Aa --noconfirm --needed \
	moka-icon-theme \
	system-san-francisco-font-git \
	ttf-ancient-fonts \
	ttf-arabeyes-fonts \
	ttf-roboto-mono
