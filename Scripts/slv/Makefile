resample:
	mkdir -p tmp
	$s orig='../../../ELTeC-slv/Orig/IMP/WIKI00024.ana.xml' -xsl:make-sample.xsl \
	../../slv/SL-WIKI00024_sample.xml \
	> tmp/SL-WIKI00024_sample.ana.xml
	$s -xsl:simplify-ana.xsl tmp/SL-WIKI00024_sample.ana.xml > tmp/SL-WIKI00024_sample.ana2.xml
test-resample:
	mkdir -p tmp
	$s orig='../../../ELTeC-slv/Orig/IMP/WIKI00024.ana.xml' -xsl:make-sample.xsl \
	../../slv/SL-WIKI00024_sample.xml \
	> tmp/SL-WIKI00024_sample.ana.xml
	$s -xsl:simplify-ana.xsl tmp/SL-WIKI00024_sample.ana.xml > tmp/SL-WIKI00024_sample.ana2.xml

j = java -jar /usr/local/bin/jing.jar https://distantreading.github.io/Schema/eltec-1.rng
s = java -jar /usr/local/bin/saxon9he.jar
