#' Estimate beta parameter
#'
#' @param duration_infectiousness Duration of infectiousness (days)
#' @param mixing_matrix Mixing matrix
#' @param R0 Basic reproduction number
#'
#' @return Beta parameter
#' @export
#'
# #' @examples
beta_est <- function(duration_infectiousness, mixing_matrix, R0) {
  if(length(duration_infectiousness) > 1){
    stop("duration_infectiousness must be of length = 1")
  }
  if(!is.numeric(duration_infectiousness) | length(duration_infectiousness) > 1 |
     duration_infectiousness < 0){
    stop("duration_infectiousness must be a positive numeric value")
  }
  if(!is.numeric(R0) | any(R0 < 0)){
    stop("R0 must be a positive numeric value")
  }
  if(!is.matrix(mixing_matrix)){
    stop("mixing_matrix must be a matrix")
  }

  ng_eigen <- Re(eigen(mixing_matrix)$values[1])
  beta <- R0/(ng_eigen * duration_infectiousness)
  return(beta)
}


#' Estimate beta parameter
#'
#' @param dur_R Duration of mild infectiousness (days)
#' @param dur_hosp Delay between symptom onset and requiring hospitalisation (days)
#' @param prob_hosp Probability of hospitilisation by ages
#' @param mixing_matrix Mixing matrix
#' @param R0 Basic reproduction number
#'
#' @return Beta parameter
#' @export
#'
# #' @examples
beta_est_explicit <- function(dur_R, dur_hosp, prob_hosp, mixing_matrix, R0) {

  # assertions
  assert_single_pos(dur_hosp, zero_allowed = FALSE)
  assert_single_pos(dur_R, zero_allowed = FALSE)
  assert_pos(R0, zero_allowed = FALSE)
  assert_numeric(prob_hosp)
  assert_numeric(mixing_matrix)
  assert_square_matrix(mixing_matrix)
  assert_same_length(mixing_matrix[,1], prob_hosp)

  if(sum(is.na(prob_hosp)) > 0) {
    stop("prob_hosp must not contain NAs")
  }

  if(sum(is.na(mixing_matrix)) > 0) {
    stop("mixing_matrix must not contain NAs")
  }

  relative_R0_by_age <- prob_hosp*dur_hosp + (1-prob_hosp)*dur_R
  adjusted_eigen <- Re(eigen(mixing_matrix*relative_R0_by_age)$values[1])
  beta <- R0/(adjusted_eigen)

  return(beta)
}
