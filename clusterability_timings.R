# Timings for the clusterability R package

# Copyright (C) 2020  Zachariah Neville, Naomi Brownstein, Andreas Adolfsson, Margareta Ackerman

# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

##### Initial setup #####
library(clusterability)
ntimes <- 1000

testandprint <- function(data, test, reduction, seed) {
  starttime <- Sys.time()
  if(test == "dip"){
    for (i in 1:ntimes) {
      clusterabilitytest(data, "dip", reduction)
    }

  } else if(test == "silverman") {
    for (i in 1:ntimes) {
      clusterabilitytest(data, "silverman", reduction, distance_standardize = "NONE", s_setseed = seed)
    }
  } else {
    stop("Invalid test")
  }

  endtime <- Sys.time()
  print(endtime - starttime)
}

##### normals1 #####
data(normals1)
normals1 <- normals1[,-3]
testandprint(normals1, "dip", "pca", NULL)
testandprint(normals1, "dip", "distance", NULL)
testandprint(normals1, "silverman", "pca", 123)
testandprint(normals1, "silverman", "distance", 123)


##### normals2 #####
data(normals2)
normals2 <- normals2[,-3]
testandprint(normals2, "dip", "pca", NULL)
testandprint(normals2, "dip", "distance", NULL)
testandprint(normals2, "silverman", "pca", 123)
testandprint(normals2, "silverman", "distance", 123)


##### normals3 #####
data(normals3)
normals3 <- normals3[,-3]
testandprint(normals3, "dip", "pca", NULL)
testandprint(normals3, "dip", "distance", NULL)
testandprint(normals3, "silverman", "pca", 123)
testandprint(normals3, "silverman", "distance", 123)


##### normals4 #####
data(normals4)
normals4 <- normals4[,-4]
testandprint(normals4, "dip", "pca", NULL)
testandprint(normals4, "dip", "distance", NULL)
testandprint(normals4, "silverman", "pca", 123)
testandprint(normals4, "silverman", "distance", 123)


##### normals5 #####
data(normals5)
normals5 <- normals5[,-4]
testandprint(normals5, "dip", "pca", NULL)
testandprint(normals5, "dip", "distance", NULL)
testandprint(normals5, "silverman", "pca", 123)
testandprint(normals5, "silverman", "distance", 123)

##### cars #####
data(cars)
testandprint(cars, "dip", "pca", NULL)
testandprint(cars, "dip", "distance", NULL)
testandprint(cars, "silverman", "pca", 123)
testandprint(cars, "silverman", "distance", 123)

##### iris #####
data(iris)
iris_numeric <- iris[,c(1:4)]
testandprint(iris_numeric, "dip", "pca", NULL)
testandprint(iris_numeric, "dip", "distance", NULL)
testandprint(iris_numeric, "silverman", "pca", 123)
testandprint(iris_numeric, "silverman", "distance", 123)

