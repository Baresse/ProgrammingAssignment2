## Tutorial : how to test cacheMatrix functions

Load the cachematrix.R source file :

	> source('cachematrix.R')
	

Define a hilbert function like this :
	
	> hilbert <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+") }

Initialize a square matrix (8x8) with this function : 

	> h8 <- hilbert(8)

Display the result :

	> h8
	          [,1]      [,2]      [,3]       [,4]       [,5]       [,6]       [,7]       [,8]
	[1,] 1.0000000 0.5000000 0.3333333 0.25000000 0.20000000 0.16666667 0.14285714 0.12500000
	[2,] 0.5000000 0.3333333 0.2500000 0.20000000 0.16666667 0.14285714 0.12500000 0.11111111
	[3,] 0.3333333 0.2500000 0.2000000 0.16666667 0.14285714 0.12500000 0.11111111 0.10000000
	[4,] 0.2500000 0.2000000 0.1666667 0.14285714 0.12500000 0.11111111 0.10000000 0.09090909
	[5,] 0.2000000 0.1666667 0.1428571 0.12500000 0.11111111 0.10000000 0.09090909 0.08333333
	[6,] 0.1666667 0.1428571 0.1250000 0.11111111 0.10000000 0.09090909 0.08333333 0.07692308
	[7,] 0.1428571 0.1250000 0.1111111 0.10000000 0.09090909 0.08333333 0.07692308 0.07142857
	[8,] 0.1250000 0.1111111 0.1000000 0.09090909 0.08333333 0.07692308 0.07142857 0.06666667
	
Compute the inverse with the `solve` function and display h8	
	
	> sh8 <- solve(h8) ; sh8
	        [,1]      [,2]       [,3]       [,4]        [,5]        [,6]        [,7]       [,8]
	[1,]      64     -2016      20160     -92400      221760     -288288      192192     -51480
	[2,]   -2016     84672    -952560    4656960   -11642400    15567552   -10594584    2882880
	[3,]   20160   -952560   11430720  -58212000   149688000  -204324119   141261119  -38918880
	[4,]  -92400   4656960  -58212000  304919999  -800414996  1109908794  -776936155  216215998
	[5,]  221760 -11642400  149688000 -800414996  2134439987 -2996753738  2118916783 -594593995
	[6,] -288288  15567552 -204324119 1109908793 -2996753738  4249941661 -3030050996  856215352
	[7,]  192192 -10594584  141261119 -776936154  2118916782 -3030050996  2175421226 -618377753
	[8,]  -51480   2882880  -38918880  216215998  -594593995   856215351  -618377753  176679358
	
	
Create a 'special' matrix with the function `makeCacheMatrix` for the above created h8 matrix
	
	> ch8 <- makeCacheMatrix(h8)

Uses `cacheSolve` method to compute the inverse matrix. Notice this the first time, the cache will not be used. 

	> sch8 <- cacheSolve(ch8)
	
	
Assert the inverse matrix is equals to the previously computed sh8 matrix
	
	> sch8 == sh8
	     [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8]
	[1,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
	[2,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
	[3,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
	[4,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
	[5,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
	[6,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
	[7,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
	[8,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
	
Now compute again the inverse matrix using the `cacheSolve` function. This time the cached value is used as described by the printed message 	
	
	> sch9 <- cacheSolve(ch8)
	getting cached inverse matrix
	
Assert the inverse matrix is equals to the previously computed sch8 matrix

	> sch9 == sch8
	     [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8]
	[1,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
	[2,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
	[3,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
	[4,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
	[5,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
	[6,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
	[7,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
	[8,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
	> 