mkdir -p tmp
rm -f tmp/*
for f in `find ../slv/*.xml`; do echo $f;\
  java -jar /usr/local/bin/saxon9he.jar -xsl:remove_dups.xsl $f > tmp/$(basename $f) ; done
