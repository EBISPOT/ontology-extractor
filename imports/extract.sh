robot filter --input ./imports/chebi.owl  --select "self annotations" --output ./build/filter.owl &&
robot template --template ./imports/template.tsv --prefix "HP: http://purl.obolibrary.org/obo/HP_" --ontology-iri "http://www.ebi.ac.uk/efo/efo.owl" --output ./build/template.owl &&
robot merge --input ./build/filter.owl --input ./build/template.owl --output ./result/import.owl
