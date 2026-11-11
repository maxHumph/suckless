.PHONY: all dwm dmenu st surf installclean

all: dwm dmenu st surf

dwm:
	$(MAKE) -C dwm clean all

dmenu:
	$(MAKE) -C dmenu clean all

st:
	$(MAKE) -C st clean all

surf:
	$(MAKE) -C surf clean all

install:
	$(MAKE) -C dwm install
	$(MAKE) -C dmenu install
	$(MAKE) -C st install
	$(MAKE) -C surf install

clean:
	$(MAKE) -C dwm clean
	$(MAKE) -C dmenu clean
	$(MAKE) -C st clean
	$(MAKE) -C surf clean
