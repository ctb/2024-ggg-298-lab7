rule all:
   input:
      "sulfo.cmp.matrix.png"

rule rule_1:
  input: "a.fa.gz"
  output: "a.sig.zip"
  shell: "sourmash sketch dna a.fa.gz --name 'Sulfurihydrogenibium' -o a.sig.zip"
  
rule rule_2:
  input: "b.fa.gz"
  output: "b.sig.zip"
  shell: "sourmash sketch dna b.fa.gz --name 'Sulfitobacter sp. EE-36' -o b.sig.zip"

  
rule rule_3:
  input: "c.fa.gz"
  output: "c.sig.zip"
  shell: "sourmash sketch dna c.fa.gz --name 'Sulfitobacter sp. NAS-14.1' -o c.sig.zip"
  
rule rule_4:
  input: "a.sig.zip", "b.sig.zip", "c.sig.zip"
  output: "sulfo.cmp", "sulfo.cmp.labels.txt"
  shell: "sourmash compare *.sig.zip -o sulfo.cmp"
  
rule rule_5:
  input: "sulfo.cmp", "sulfo.cmp.labels.txt"
  output: "sulfo.cmp.matrix.png"
  shell: "sourmash plot sulfo.cmp"
