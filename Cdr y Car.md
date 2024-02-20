- # Car y Cdr
 * ###  (a b c d f g h)
 
``` lisp
 (car (cddddr (cddr '(a b c d f g h))))

```
### R = H

``` lisp
(car (cddddr (cdr '(a b c d f g h))))

```
### R = G

``` lisp
 (car (cddddr '(a b c d f g h)))

```
### R = F

``` lisp
  (car (cddr '(a b c d f g h)))

```
### R = C

 * ###  ((a)(b d)((1 2) 3))

``` lisp
  (car (car (cdr (cdr '((a) (b d) ((1 2) 3))))))

```
### R = D

``` lisp
  (car (cdr (car (cdr (car (cdr (cdr '((a) (b d) ((1 2) 3)))))))))
  
```
### R = 2

``` lisp
  (caar (cddr '((a)(b d)((1 2) 3))))
  
```
### R = (1 2)

``` lisp
  (car (cdr (car (cdr (cdr '((a) (b d) ((1 2) 3)))))))
  
```
### R = 3

 * ###  ((1 2 3) ((4 5 6))((7 8 9 10)))

``` lisp
  (car (car (cdr (car (cdr '((1 2 3) ((4 5 6)) ((7 8 9 10))))))))
  
```
### R = 4

``` lisp
  (car (car (cdr (cdr (cdr '((1 2 3) ((4 5 6)) ((7 8 9 10))))))))
  
```
### R = 7

``` lisp
  (car (cdr (car '((1 2 3) ((4 5 6)) ((7 8 9 10))))))

```
### R = 3

``` lisp
  (car (cdr (cdr (cdr (car '((1 2 3) ((4 5 6)) ((7 8 9 10))))))))
    
```
### R = 10




