all:
	rm -rf  *~ */*~ */*/*~
doc_gen:
	rm -rf  node_config logfiles doc/*;
	erlc ../doc_gen.erl;
	erl -s doc_gen start -sname doc

release:
	rm -rf common iaas;
	mkdir common;
	mkdir common/ebin;
	mkdir iaas;
	mkdir iaas/ebin;
	cp ../../common/src/*.app common/ebin;
	erlc -o common/ebin ../../common/src/*.erl;
	cp ../../iaas/src/*.app iaas/ebin;
	erlc -o iaas/ebin ../../iaas/src/*.erl


test:
	rm -rf  ebin/* test_ebin/* src/*~ test_src/*~ *~ erl_crash.dump src/*.beam test_src/*.beam;
	rm -rf Mnesia*;
#	common
	cp ../common/src/*app ebin;
	erlc -o ebin ../common/src/*.erl;
#	dbase
	cp ../dbase_service/src/*app ebin;
	erlc -o ebin ../dbase_service/src/*.erl;
#	iaas
	cp src/*app ebin;
	erlc -o ebin src/*.erl;
	erlc -o test_ebin test_src/*.erl;
	erl -pa ebin -pa ebin -pa test_ebin -s iaas_tests start -name 10250 -setcookie abc
