REPO = https://github.com/TyGuS/htt.git
TAG = master
WORKDIR = workdir

.PHONY: all get

all: $(WORKDIR)
	dune build

get: $(WORKDIR)

$(WORKDIR):
	git clone --recursive --depth=1 -b $(TAG) $(REPO) $(WORKDIR)
	cd $(WORKDIR) && git apply ../etc/patches/*.patch
	cp -r dune-files/* $(WORKDIR)/

install:
	dune install coq-htt
