% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/object.R
\name{plot.squire_simulation}
\alias{plot.squire_simulation}
\title{squire simulation plot}
\usage{
\method{plot}{squire_simulation}(
  x,
  replicates = FALSE,
  summarise = TRUE,
  ci = TRUE,
  q = c(0.025, 0.975),
  var_select = NULL,
  summary_f = mean,
  x_var = "t",
  ...
)
}
\arguments{
\item{x}{An iccm_simulation object}

\item{replicates}{Plot replicates}

\item{summarise}{Logical, add summary line}

\item{ci}{logical add confidence interval ribbon}

\item{q}{Quantiles for upper and lower of interval ribbon}

\item{var_select}{Vector of variable names to plot (default is all)}

\item{summary_f}{Function to summarise each compartment
passed to the \code{fun} argument of \code{\link[ggplot2]{stat_summary}}}

\item{x_var}{X variable to use for plotting (default is \code{"t"}, but can be set to, \code{"date"}, if \code{date_0} provided)}

\item{...}{additional arguments affecting the plot produced.}
}
\description{
squire simulation plot
}
