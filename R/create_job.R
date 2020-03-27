#create_job.R



#' Creates a simple submission for the BMRC cluster
#'
#' This is an old function, barely used anymore
#' @title create_job
#' @param path path to directory where you want the submission script to be created
#' @param subname name of the script you would like to run, minus the extension R of sh
#' @param jobname name of the job submitted to the cluster
#' @param projectletter letter of the project you would like to use
#' @param qletter letter of the queue you would like to use
#' @param qlength length of the job you would like to submit e.g. short
#' @param R is the job an R script? If not, defaults to bash script
#' @return creates a file to run through the cluster with qsub
#' @export
#' @author Jamie Inshaw
create_job<-function(path, subname, jobname, projectletter, qletter, qlength, R=F){
  sink(file=paste0(path,subname))
  cat(paste0("#!/bin/bash

#$ -cwd -V
#$ -N ",jobname," -j y
#$ -P todd.prj",projectletter," -q ",qlength,".q",qletter,"\n"))
  if (R==T){
    cat(paste0("Rscript ", path,subname, ".R"))
  }
  if (R==F){
    cat(paste0(path,subname,".sh"))
  }
  sink()
}

