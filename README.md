# doWhile
Package implementing a do while loop in R.

# Install

```{r}
library(devtools)
devtools::install_github("mrparker909/doWhile")
```

# Examples

If you don't mind assigning global variables such as k:

```{r}
k <<- 0
doWhile({k<<-k+1; print(k)}, {k<5})
rm(k)
```

If you don't want global variables:


```{r}
doWhile(do={k=k+1; print(k)}, While={k<5}, vars=list(k=0))
```

or alternatively:

```{r}
doWhile({if(!exists("k")) {k<-1} else {k<-k+1}; print(k)}, {k<5})
```


If you want a return variable:

```{r}
K = doWhile({k <- k+1; print(k)}, {k<5}, {k}, list(k=0))
print(K)
```


And the same as above, but more explicit:

```{r}
K = doWhile(do     = {k <- k+1; print(k)}, 
            While  = {k<5},
            Return = {k},
            vars   = list(k=0))
print(K)
```
