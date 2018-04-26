#This class is used as a container that holds all the reported errors.

ReportClass<-R6::R6Class(
  classname='ReportClass',
  public = list(
    initialize = function() {
      #do nothing
    },
    add_element=function(type, case, var, par1=character(0), par2=character(0)) {
      item<-list(type=type, case=case, var=var, par1=par1, par2=par2)
      private$elements_<-c(private$elements_, list(item))
    }
  ),
  active = list(
    elements=function() {private$elements_}
  ),
  private = list(
    elements_=list() #Each element is a list with members: case, var, type, par1, par2
  )
)
