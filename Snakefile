# default rule - make a comparison matrix
rule FOO:
   input:
      "sulfo.cmp.matrix.png"

# sketch individual genomes
rule rule_1:
  input: "{name}.fa.gz"
  output: "{name}.sig.zip"
  shell: "sourmash sketch dna {input} -o {output} --name {wildcards.name}"

rule rule_4:
  input: "a.sig.zip", "b.sig.zip", "c.sig.zip"
  output: "sulfo.cmp", "sulfo.cmp.labels.txt"
  shell: "sourmash compare *.sig.zip -o sulfo.cmp"
  
rule rule_5:
  input: "sulfo.cmp", "sulfo.cmp.labels.txt"
  output: "sulfo.cmp.matrix.png"
  shell: "sourmash plot sulfo.cmp"
