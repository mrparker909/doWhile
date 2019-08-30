test_that("doWhile works", {

  i=doWhile(do={if(!exists("i")){i<-0} else {i=i+1}}, While={i<10}, Return={i})
  expect_equal(i, 10)

  i=doWhile(do={if(!exists("j")){j<-0} else {j=j+1}}, While={j<10}, Return={j})
  expect_equal(i, 10)

  i=doWhile(do={if(!exists("j")){j<-0; jPI<-0} else {j=j+1; jPI=jPI+pi}}, While={j<10}, Return={jPI})
  expect_equal(10*pi,i)

  Y = doWhile(do    ={ if(!exists("E")) {E<-list(x=pi, y=exp(1))}; E$y=E$x+E$y},
              While ={ E$y < 100},
              Return={ E$y}
              )
  expect_equal(Y < 105, TRUE)
})
