source("dataHelper.R")
plotList <- list()


getDevConfig <- function(plotName = NULL, defaults = FALSE){
  defaultOptions <- list(name = 'default', filename = '', dirPath = '',
                        fpath = '', isValid = FALSE, width = 480, height = 480,
                        units = 'px', format = 'png')
  if (defaults) {
    print('getDevConfig() -> defaultOptions')
    return(defaultOptions)
  } else {
    if (!is.null(plotName) & !is.null(plotList[plotName][[1]])) {
      return(plotList[plotName])
    } else {
      return(NULL)
    }
  }
}

configDev <- function(plotName, useDefaults = TRUE, options = NULL) {
  if (useDefaults) {
    plotConfig <- getDevConfig(defaults = T)
    plotConfig$dirPath = ''
  } else {
    if (!is.null(options)) {
      return(NULL)
    }
  }
  plotConfig$name <- plotName
  plotConfig$filename <- paste0(plotName, '.', plotConfig$format)
  plotConfig$fPath <- paste0(plotConfig$dirPath, plotConfig$filename)
  plotConfig$isValid <- TRUE
  print('configDev() -> plotConfig')
  return(plotConfig)
}

startDev <- function(plotName, useDefaults = TRUE, env = parent.frame()) {
  plotConfig <- configDev(plotName)
  if (plotConfig$format == 'png') {
    print('Starting PNG Device...')
    png(
      filename = plotConfig$fPath,
      width = plotConfig$width,
      height = plotConfig$height,
      units = 'px'
    ) #%>% return()

    #return(TRUE)
  } else {
    return(FALSE)
  }
}

closeDev <- function(env = parent.frame()) {
  dev.off() %>%
    eval(parent.frame())
}

