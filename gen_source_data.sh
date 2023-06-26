#!/bin/bash
cd source_data

[ ! -d "Snappy_TestData" ] && mkdir -p Snappy_TestData && \
	cd Snappy_TestData && git init && git remote add -f\
	origin https://github.com/google/snappy.git && \
	git config core.sparseCheckout true && \
	echo "testdata/ >> .git/info/sparse-checkout" &&
	git pull origin main && mkdir -p ../Snappy && \
	cp -r testdata/* ../Snappy/ && cd ..

[ ! -d "Calgary" ] && \
	wget http://corpus.canterbury.ac.nz/resources/calgary.tar.gz && \
	mkdir -p Calgary && tar -xzf calgary.tar.gz -C Calgary

[ ! -d "Canterbury" ] && \
	wget http://corpus.canterbury.ac.nz/resources/cantrbry.tar.gz && \
	mkdir -p Canterbury && tar -xzf cantrbry.tar.gz -C Canterbury

[ ! -d "Silesia" ] && \
	wget https://sun.aei.polsl.pl//~sdeor/corpus/silesia.zip && \
	mkdir -p Silesia && unzip silesia.zip -d Silesia
