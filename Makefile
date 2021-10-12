VERSION := $(shell grep "^version" snap/snapcraft.yaml | cut -d" " -f2 | tr -d "'")
TARGET := chirp_$(VERSION)_amd64.snap

$(TARGET):
	snapcraft

build: $(TARGET)

install: build
	sudo snap install $(TARGET) --devmode

clean:
	$(RM) $(TARGET)

distclean: clean
	snapcraft clean
