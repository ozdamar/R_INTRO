####################################################
##                                                ##
##              INTRODUCTION TO R                 ##
##                    2018                        ##
##                                                ##
##  E. Ozge Ozdamar - ozge.ozdamar@msgsu.edu.tr   ##
####################################################
##                                                ##
##               1 - exercises                    ##
##                                                ##
####################################################

# Asagidaki ifadeleri R a girerek sonuçları inceleyin 
1:5 + 6:10
c(1, 3, 6, 10, 15) + c(0, 1, 3, 6, 10)
sum(1:5)
median(1:5)
sum(1, 2, 3, 4, 5)
median(1, 2, 3, 4, 5)
c(2, 3, 5, 7, 11, 13)-2
-2:2 * -2:2
identical(2 ^ 3, 2 ** 3)
1:10 / 3
1:10 %/% 3
1:10 %% 3
cos(c(0, pi / 4, pi / 2, pi))
exp(pi * 1i) + 1
factorial(7) + factorial(1) - 71 ^ 2
choose(5, 0:5)
c(3, 4 - 1, 1 + 1 + 1) == 3
1:3 != 3:1
exp(1:5) < 100
(1:5) ^ 2 >= 16
sqrt(2) ^ 2 == 2
sqrt(2) ^ 2 -2
all.equal(sqrt(2) ^ 2, 2)
all.equal(sqrt(2) ^ 2, 3)
isTRUE(all.equal(sqrt(2) ^ 2, 3))
c("Can", "you", "can", "a", "can", "as","a", "canner", "can", "can", "a", "can?") == "can"
c("A", "B", "C", "D") < "C"
c("a", "b", "c", "d") < "C"

# Asagidaki soruları önce kağıt üzerinde çözün sonra r da kontrol edin
7:11
seq(2-9)
seq(4,10,by=2)
seq(3,30,length=10)
seq(6,-4,by=-2)
rep(2,4)
rep(c(1,2),4)
rep(c(1,2),c(4,4))
rep(1:4,4)
rep(1:4,rep(3,4))

# rep fonksiyonunu kullanarak şu vektörleri oluşturun
# 6,6,6,6,6,6
# 5,8,5,8,5,8,5,8
# 5,5,5,5,8,8,8,8

# rep ve seq fonksiyonları kullanarak aşağıdaki vektörleri oluşturun
#1 2 3 4 5 6 7 8 9
#"m" "w" "m" "w" "m" "w" "m" "w" "m" "w"
# 1 2 3 4 1 2 3 4 1 2 3 4
# 4 4 4 3 3 3 2 2 2 1 1 1
# Hint: Use argument each of the function rep.
# 1 2 2 3 3 3 4 4 4 4 5 5 5 5 5
# 1 1 3 3 5 5 7 7 9 9 11 11

X<- c(5,9,2,3,4,6,7,0,8,12,2,9) #olmak üzere, önce kağıt üzerinde çözün sonra r da kontrol edin 
X[2]
X[2:4]
X[c(2,3,6)]
X[c(1:5,10:12)]
X[-(10:12)]
