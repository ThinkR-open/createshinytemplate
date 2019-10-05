
#' get system requirements
#'
#' @param packages character vector of packages names
#' @param quiet boolean if TRUE the function is quiet
#' @importFrom miniCRAN pkgDep
#' @importFrom utils download.file
#' @importFrom jsonlite fromJSON
get_sysreqs <- function(packages, quiet = TRUE){
all_deps <- paste(miniCRAN::pkgDep(packages,suggests = FALSE,quiet=quiet), collapse = ",")
url <- sprintf("https://sysreqs.r-hub.io/pkg/%s/linux-x86_64-debian-gcc",all_deps)
path <- tempfile()
utils::download.file(url, path,mode = "wb",quiet = quiet)
out <- jsonlite::fromJSON(path)
unlink(path)
out
}