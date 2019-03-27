mkdir build
mkdir result
curl https://www.ebi.ac.uk/ols/ontologies/hp/download > ./imports/hp.owl
awk '{print $1}' ./imports/template.tsv | awk '!/ID/ {print}' > ./build/terms.txt
sed -e 's/^/ --term /' ./build/terms.txt | tr -d "\n\r" > ./build/terms_list.txt
f1="$(< ./build/terms_list.txt)"
awk -v f1="$f1" '/robot filter --input .\/imports\/chebi.owl/ {print $1 " " $2 " " $3 " " $4 " " f1 " " $5 " " $6 " " $7 " " $8 " " $9}' ./imports/extract.sh > ./imports/extract_terms.sh
tail -n+2 ./imports/extract.sh >> ./imports/extract_terms.sh