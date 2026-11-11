.PHONY: all dwm dmenu st surf dwm-build dmenu-build st-build surf-build dwm-install dmenu-install st-install surf-install clean

all: dwm dmenu st surf

dwm: dwm-build dwm-install

dmenu: dmenu-build dmenu-install

st: st-build st-install

surf: surf-build surf-install

dwm-build:
	$(MAKE) -C dwm clean all

dmenu-build:
	$(MAKE) -C dmenu clean all

st-build:
	$(MAKE) -C st clean all

surf-build:
	$(MAKE) -C surf clean all

dwm-install:
	$(MAKE) -C dwm install

dmenu-install:
	$(MAKE) -C dmenu install

st-install:
	$(MAKE) -C st install

surf-install:
	$(MAKE) -C surf install

clean:
	$(MAKE) -C dwm clean
	$(MAKE) -C dmenu clean
	$(MAKE) -C st clean
	$(MAKE) -C surf clean
