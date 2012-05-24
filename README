Introduction
============
This is a little [R] script that translates a 2 x 2 table into a karyotype file for input into [Circos]. Inputting data using the regular karyotype/segdup process is more flesible--but a little more difficult--than the tableviewer. This was originally used for a Circos diagram created to visualize transitions from college major to employment. However, this is flexible to translate any 2 x 2 table into the appropriate karyotype.

Description
===========
Typically, data from a database is available in a 2 x 2 file that is easily generated from a database or from an Excel PivotTable. For example:
<table>
	<tr>
		<td>5</td><td>10</td><td>15</td>
	</tr>
	<tr>
		<td>2</td><td>4</td><td>6</td>
	</tr>
</table>
In this example, the row represents one variable and the columns represent a second. Notice the table may be rectangular when using circosRearrange.

The karyotype file needs to keep a running table to mark the start and end point for each ribbon. In this example, the first ribbon would be from position 0 to 5, while the second will be between 6 and 15, and so forth.

Instructions
============
This is an adaptation from another project where I worked with two types of variables (CAREER CLUSTERS) and industry (NAIC CODES). Load the function into R circosRearrange, which takes one input--xtab.

Usage
-----
circosRearrange(xtab)

Arguments
---------
<table>
	<tr>
		<td>xtab</td><td>A rectangular or square matric of integers or numeric data representing two variables (row and column).</td>
	</tr>
</table>

Post Processing
---------------
This was adapted from a prior project, so you will need to change some naming conventions. In particular, adjust line 78 to represent the chr column for row data and adjust line 98 to represent the chr column for column data.

You also need to give each row a unique id before using the output from circosRearrange in Circos. The best way is to open the output from R in a spreadsheet editor and manually add the unique id.

License
=======
This is distributed under [GNU-GPL 2.0].

[R]: www.r-project.org
[Circos]: http://circos.ca/
[chr column]: http://circos.ca/documentation/tutorials/configuration/data_files/
[GNU-GPL 2.0]: http://www.gnu.org/licenses/gpl-2.0.html
