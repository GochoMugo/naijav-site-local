
NANOHTTPD_TARBALL=https://github.com/NanoHttpd/nanohttpd/archive/Release-2.1.0.tar.gz


build: naijav/_site lib
	mkdir -p build/naijav
	cp -r naijav/_site/* build/naijav/
	cp bin/webserver.jar build/
	cp -r -p lib/* build/


naijav/_site: naijav
	cd naijav && jekyll build


naijav:
	cd naijav/ && git pull


bin: bin/webserver.jar


bin/webserver.jar:
	mkdir -p bin/nanohttpd
	wget ${NANOHTTPD_TARBALL} -O bin/nanohttpd.tar.gz
	cd bin && tar xvf nanohttpd.tar.gz --directory=nanohttpd
	mv bin/nanohttpd/*/* bin/nanohttpd/
	rm bin/nanohttpd.tar.gz
	cd bin/nanohttpd && mvn package -Dmaven.test.skip=true \
		&& cd webserver/target \
		&& ls | grep "jar-with-dependencies" \
		| xargs -I {} mv {} ../../../../$@


clean:
	rm -r build bin


.PHONY: naijav clean
