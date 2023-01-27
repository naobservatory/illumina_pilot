#!/usr/bin/env bash

#For each entry in virus_genbank_accession.csv, get the NCBI taxid from NCBI's eutils API. Add the taxid next to the accession number in a new column in virus_genbank_accession.csv

#The NCBI eutils API can only handle 200 accession numbers per request. So we need to group accession numbers into a comma separated list with a maximum number of 200 accession numbers per request. We do this by using the 'paste' command to join the accession numbers into a comma separated list, and then using the 'fold' command to split the comma separated list into lines with a maximum of ~200 entries.

#Concatenate all accession numbers into a single line, separated by commas
paste -s -d , virus_genbank_accession.csv |\
#insert space after every comma so the downstream fold command doesn't break in the middle of an accession number
sed 's/,/, /g' |\
#split the line into lines with a maximum of 2200 characters
fold -s -w 2200 |\
#remove all spaces and " characters
sed 's/ //g' |\
sed 's/"//g' > virus_genbank_accession_folded.txt


# virus_genbank_accession_folded.txt
# while read line;
# do
# 	#Get the NCBI taxid for each accession number in the line
#     # curl "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=${line}&rettype=fasta&retmode=xml" |\
#     # echo ;
# 	echo $line
# done

https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=AY714813,JN555585,JN561323,JQ596859,AF533768,KY628968,KY628970,KT594769,MT900475,JQ360576,DQ149153,AB825953,HM625781,JX898220,AY261359,KU936049,KT819633,MG989243,AF275348,MH036942,MH036943,MH036941,AY665713,KM051845,AF030027,MF431611,AP010838,FJ478159,X04370,MF678601,MH509440,JF797218,AY124577,FJ483970,JQ264772,FJ483968,AY446894,AY186194,JN227533,KR297253,AF480884,AC090446,KR351281,FJ483967,GU305914,AF232689,JX867617,KC462165,KT832477,KF921519,KC503762,JQ805139,AF281817,AF037218,X83413,AF157706,KU351741,KY355735,KF017583,KY965444,AF319782&rettype=fasta&retmode=xml"

AY714813,JN555585,JN561323,JQ596859,AF533768,KY628968,KY628970,KT594769,MT900475,JQ360576,DQ149153,AB825953,HM625781,JX898220,AY261359,KU936049,KT819633,MG989243,AF275348,MH036942,MH036943,MH036941,AY665713,KM051845,AF030027,MF431611,AP010838,FJ478159,X04370,MF678601,MH509440,JF797218,AY124577,FJ483970,JQ264772,FJ483968,AY446894,AY186194,JN227533,KR297253,AF480884,AC090446,KR351281,FJ483967,GU305914,AF232689,JX867617,KC462165,KT832477,KF921519,KC503762,JQ805139,AF281817,AF037218,X83413,AF157706,KU351741,KY355735,KF017583,KY965444,AF319782


curl https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=AY714813,JN555585,JN561323,JQ596859,AF533768,KY628968,KY628970,KT594769,MT900475,JQ360576,DQ149153,AB825953,HM625781,JX898220,AY261359,KU936049,KT819633,MG989243,AF275348,MH036942,MH036943,MH036941,AY665713,KM051845,AF030027,MF431611,AP010838,FJ478159,X04370,MF678601,MH509440,JF797218,AY124577,FJ483970,JQ264772,FJ483968,AY446894,AY186194,JN227533,KR297253,AF480884,AC090446,KR351281,FJ483967,GU305914,AF232689,JX867617,KC462165,KT832477,KF921519,KC503762,JQ805139,AF281817,AF037218,X83413,AF157706,KU351741,KY355735,KF017583,KY965444&rettype=uilist&retmode=text


curl https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=GENBANK_ID1,GENBANK_ID2,[...],GENBANK_ID200&rettype=uilist&retmode=text


curl https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=GENBANK_ID1,GENBANK_ID2,[...],GENBANK_ID200&rettype=fasta&retmode=xml

JN555585,JN561323,JQ596859,AF533768,KY628968,KY628970,KT594769,MT900475,JQ360576,DQ149153,AB825953,HM625781

https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=JN555585,JN561323,JQ596859,AF533768,KY628968,KY628970,KT594769,MT900475,JQ360576,DQ149153,AB825953,HM625781&rettype=fasta&retmode=xml