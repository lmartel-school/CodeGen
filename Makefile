
ASSN = 4J
CLASS= cs143
CLASSDIR= /afs/ir/class/cs143

SRC= CgenClassTable.java CgenNode.java CgenSupport.java TreeConstants.java cool-tree.java IntSymbol.java StringSymbol.java BoolConst.java example.cl README
CSRC = \
	ASTConstants.java \
	ASTLexer.java \
	ASTParser.java \
	AbstractSymbol.java \
	AbstractTable.java \
	Flags.java \
	IdSymbol.java \
	IdTable.java \
	IntTable.java \
	ListNode.java \
	Cgen.java \
	StringTable.java \
	SymbolTable.java \
	SymtabExample.java \
	TokenConstants.java \
	TreeNode.java \
	ClassTable.java \
	Utilities.java

TSRC= mycoolc cool-tree.aps
CGEN= 
LIBS= lexer parser semant
CFIL= ${CSRC} ${CGEN} CgenClassTable.java CgenNode.java CgenSupport.java TreeConstants.java cool-tree.java IntSymbol.java StringSymbol.java BoolConst.java
HFIL= 
LSRC= Makefile
CLS= ${CFIL:.java=.class}
OUTPUT= example.output
SHELL = /bin/bash

JAVAC := javac

# rt.jar yet again
CUPCLASSPATH := ${CLASSDIR}/lib/java-cup-11a.jar
CLASSPATH := ${CLASSDIR}/lib:.:/usr/java/lib/rt.jar:${CUPCLASSPATH}

cgen: Makefile ${CLS}
	@rm -f cgen
	echo '#!/bin/sh' >> cgen
	echo 'java -classpath ${CLASSPATH} Cgen $$*' >> cgen
	chmod 755 cgen

${OUTPUT}: cgen
	@rm -f ${OUTPUT}
	./mycoolc  example.cl &> example.output

dotest:	cgen example.cl
	@echo "\nRunning code generator on example.cl\n"
	-./mycoolc example.cl

clean:
	rm -f ${OUTPUT} *.class core ${CLS} ${CGEN}

submit: cgen
	$(CLASSDIR)/bin/pa_submit PA4J .

# build rules

%.class : %.java TokenConstants.class cool-tree.class
	${JAVAC} -d . -sourcepath .:src -classpath ${CLASSPATH} $<

%.class : src/%.java TokenConstants.class cool-tree.class
	${JAVAC} -d . -sourcepath .:src -classpath ${CLASSPATH} $<

# dummy dependency
cool-tree.class : ./cool-tree.java
	${JAVAC} -d . -sourcepath .:src -classpath ${CLASSPATH} $<
	touch $@

TokenConstants.class : src/TokenConstants.java
	${JAVAC} -d . -sourcepath .:src -classpath ${CLASSPATH} $<

# extra dependencies:
