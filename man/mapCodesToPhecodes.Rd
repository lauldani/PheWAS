\name{mapCodesToPhecodes}
\alias{mapCodesToPhecodes}
\title{
Map codes to phecodes
}
\description{
This function takes a data frame with codes and maps them to phecodes. It can support aribitrary maps of codes to phecodes and phecode rollup maps. The included mappings are from ICD9CM and ICD10CM.
}
\usage{
mapCodesToPhecodes(input, 
           vocabulary.map=PheWAS::phecode_map,
           rollup.map=PheWAS:::phecode_rollup_map,
           make.distinct=TRUE)
}
\arguments{
  \item{input}{
Data frame containing \code{vocabulary_id} and \code{code} columns. These columns specify the vocabulary used in each row, eg ICD9CM or ICD10CM, and the code to be translated. \code{code} must be a character or factor to ensure proper conversion (ICD9CM codes lose specificity as numeric).
}
  \item{vocabulary.map}{
Data frame with columns \code{vocabulary_id}, \code{code}, and \code{phecode}. Each row represents a mapping from a specific vocabulary and code to a specific phecode. The default map \code{\link[PheWAS:phecode_map]{PheWAS::phecode_map}} supports ICD9CM (map v1.2) and ICD10CM (map 2018 beta). If \code{NULL}, it will skip the mapping codes to phecodes step. This may be useful if one is seeking to expand or roll up an existing set of phecodes.
}
  \item{rollup.map}{
Data frame with columns \code{code}, and \code{phecode_unrolled}. Each row represents a mapping from a specific phecode to all parent phecodes. The default map \code{\link[PheWAS:phecode_rollup_map]{PheWAS::phecode_rollup_map}} is the complete rollup map for phecode map v1.2. If \code{NULL}, it will skip the rollup step. This may be useful if one is seeking to only consider the directly mapped phecodes.
}
  \item{make.distinct}{
Boolean value. Should duplicate rows be removed during mapping? Default is \code{TRUE}. Useful to reduce data size, especially when another column, eg date of code, is provided.
}
}
\details{

}
\value{
A data frame containing the columns in \code{input}, except the origial \code{code} and \code{vocabulary_id} columns have been replaced with \code{phecode} now containing the phecode as character. 
}
\author{
Robert Carroll
Laura Wiley
}

\examples{
diabetes_billing=data.frame(id=1:3,vocabulary_id=c("ICD9CM","ICD9CM","ICD10CM"),code=c("250.00","250.01","E11.00"))
phecodes=mapCodesToPhecodes(diabetes_billing)
phecodes
addPhecodeInfo(phecodes)
}
\keyword{ utilities }
