OUTPUTDIR=public
SSH_TARGET=cloud:/home/andrew/sites/econs20.classes/public_html

.PHONY : all clean serve build deploy

all:  build

# Site building -----------------------------------------------------------
clean:
	rm -rf public/

build: 
	Rscript -e "blogdown::build_site()"

serve: build
	Rscript -e "blogdown::serve_site(port=4321)"

deploy: build
	rsync -Prvzc --exclude='.DS_Store' --exclude='.Rproj.user/' --delete $(OUTPUTDIR)/ $(SSH_TARGET)
