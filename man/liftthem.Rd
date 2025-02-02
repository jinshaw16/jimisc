% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/liftthem.R
\name{liftthem}
\alias{liftthem}
\title{liftthem}
\usage{
liftthem(frame, chain, snp.name = "snp.name", chromosome = "chromosome",
  position = "position", updateto)
}
\arguments{
\item{frame}{dataframe  with variant info in}

\item{chain}{chainfile to use for the liftover}

\item{snp.name}{column name for the variant name in the data frame}

\item{chromosome}{column name for the chromosome in the data frame}

\item{position}{column name for the position in the data frame}

\item{updateto}{numeric build number to update to}
}
\value{
data frame with new column for the position in the requested genome build
}
\description{
Liftover to a genomic build conveniently
}
\author{
Jamie Inshaw
}
