#' @title doWhile
#' @param do     Expression to evaluate at least once. The "do" expression will be repeated until the "While" condition is FALSE.
#' @param While  Logical expression indicating the stopping condition. The doWhile loop will end when the "While" condition is no longer TRUE.
#' @param Return Expression to evaluate and return (allows returning of variables scoped inside the doWhile function).
#' @export
#' @examples
#'
#' # Note that i remains zero here due to scoping
#' i=0
#' doWhile(do={i=i+1; print(i)}, While={i<10}, Return=i)
#' print(i)
#'
#' # But we can force an update of i using "i <<- i+1"
#' i=0
#' doWhile(do={i<<-i+1; print(i)}, While={i<10}, Return=i)
#' print(i)
#'
#' # or we can declare j (and jPI) in the scope of the doWhile:
#' jPI=doWhile(do={if(!exists("j")|!exists("jPI")){j<-0;jPI<-0}
#'                 else{j=j+1; jPI=jPI+pi}},
#'             While={j<10},
#'             Return={jPI})
#' print(jPI)
#'
#' # Using a list lets us check existence just once when we have many parameters in the loop:
#' Y = doWhile(do    ={ if(!exists("E")) {E<-list(x=pi, y=exp(1))}; E$y=E$x+E$y},
#'             While ={ E$y < 100},
#'             Return={ E$y})
#' print(Y)
doWhile <- function(do, While=F, Return=NULL) {
    eval(substitute(do), env=environment())
  while(eval(substitute(While), env=environment())) {
    eval(substitute(do), env=environment())
  }
  return(eval(substitute(Return), env=environment()))
}