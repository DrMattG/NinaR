#' @title NINA Map Report format.
#'
#' @description
#'  Provides an Rmarkdown template for creating a NINA Map Report.
#'  The template is available in Rstudio through `New File ->
#'  R Markdown -> From Template` but can also be retrieved as shown in the example below.
#'
#'  This template requires a working \code{LaTeX} installation. For Windows computers, install "MikTeX".
#'  For Mac, install "MacTex". Linux machines usually have \code{LaTeX} available through their repositories. "texlive"
#'  is the preferred version for Ubuntu, and is installed on the N16 server and therefore
#'  available through the Rstudio server there.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to
#'   \code{\link[rmarkdown:render]{render}}
#'
#' @examples
#'
#' \dontrun{
#' # initiate a template
#' library(rmarkdown)
#' draft("MyReportMap.Rmd", template = "nina_map", package = "NinaR")
#'
#' #render an article manually
#' render("MyReportMap.Rmd", ninaMap.R())
#'
#' }
#'
#' @export
ninaMap <- function(...,
                        keep_tex = TRUE,
                        md_extensions = c("-autolink_bare_uris","+header_attributes")) {
  fmt <- inherit_pdf_document(...,
                              template = find_resource("nina_map", "template.tex"),
                              keep_tex = keep_tex,
                              md_extensions = md_extensions
  )

  fmt$pandoc$args <- c(fmt$pandoc$args, "--csl", "nina.csl")

  fmt

}
