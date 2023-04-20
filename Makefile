REPO = https://github.com/imdea-software/htt.git
TAG = master
WORKDIR = workdir

.PHONY: all get

all: $(WORKDIR)
	dune build

get: $(WORKDIR)

$(WORKDIR):
	git clone --recursive --depth=1 -b $(TAG) $(REPO) $(WORKDIR)
	cp -r dune-files/* $(WORKDIR)/

install:
	dune install coq-htt
