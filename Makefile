all : core surf

core: dwm dmenu st

dwm:
	cd dwm
	make clean install

dmenu:
	cd dmenu
	make clean install

st:
	cd st
	make clean install

surf:
	cd surf
	make clean install
