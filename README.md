# WG2-Sample

Repository, initially for the use of WG2 in preparing their white paper on "Annotating European Novels for Distant Reading".

It should contain a total of 100 samples from each of at least 7 different ELTeC repositories, made up of 5 random passages of 400 whitespace-delimited tokens taken from each of 20 novels. Headings should be excluded, but not poetry and each sample should be a well formed XML fragment.

Samples were selected using the `selector.xsl` stylesheet, as follows:
- generate a sequence of five random numbers in the range 1 to n, where n is the number of paragraphs in the body of a text (using www.random.net)
- for each such number r, create a new `<sample>`, containing the rth and following paragraphs, such that the total word count is at least 400
- if the end of a chapter or other division occurs before the required number of words have been copied, continue (but ignore any text not contained by a paragraph)
- if the end of the text occurs before the required number of words have been copied, the sample generated is empty

All tagging except for the `<p>` delimiting each paragraph is removed. Each `<p>` uses its @n
attribute to supply a locator
made by concatenating the text identifier (value of TEI/@xml:id) and the paragraph sequence number.

Each set of five samples is stored in a file named `[text-identifier]_sample.xml`. All the files for
each language are stored in a directory named for the language. 

 
 
