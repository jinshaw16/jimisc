#liftthem.R


#' Liftover to a genomic build conveniently
#' @title liftthem
#' @param frame dataframe  with variant info in
#' @param chain chainfile to use for the liftover
#' @param snp.name column name for the variant name in the data frame
#' @param chromosome column name for the chromosome in the data frame
#' @param position column name for the position in the data frame
#' @param updateto numeric build number to update to
#' @return data frame with new column for the position in the requested genome build
#' @export
#' @author Jamie Inshaw
liftthem<-function(frame, chain,snp.name="snp.name", chromosome="chromosome", position="position", updateto){

if(is.character(frame[,chromosome])){
  if(substr(1,3,frame[1,chromosome])=="chr")
    chr<-paste0(frame[,chromosome])
}

chr<-paste0("chr", frame[,chromosome])
start<-frame[,position]
snp<-frame[,snp.name]
frame[,"snp.name"]<-frame[,snp.name]
frame[,"pos"]<-c(1:nrow(frame))

chain.file.path<-paste0("/well/todd/users/jinshaw/liftover_allign/",chain)

## convert to Genomic Ranges

input<-GRanges(
  seqname=Rle(chr),
  ranges=IRanges(start=start,end=start),
  snp.name=snp)


c<-import.chain(chain.file.path) 
alligned<-unlist(liftOver(input,c))  
names(mcols(alligned))<-'snp.name'

updated<-data.frame(snp.name=alligned@elementMetadata@listData$snp.name)
updated[,paste0("position",updateto)]<-alligned@ranges@start
frame<-merge(frame, updated, by="snp.name")
frame<-frame[order(frame$pos),]
frame$pos<-NULL
return(frame)
}
