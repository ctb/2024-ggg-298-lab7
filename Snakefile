#SAMPLES=['a', 'b', 'c']

FILES=glob_wildcards("{sample}.fa.gz")

SAMPLES=FILES.sample
print("SAMPLES is", SAMPLES)

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
  input: expand("{filename}.sig.zip", filename=SAMPLES)
  output: "sulfo.cmp", "sulfo.cmp.labels.txt"
  shell: "sourmash compare {input} -o sulfo.cmp"
  
rule rule_5:
  input: "sulfo.cmp", "sulfo.cmp.labels.txt"
  output: "sulfo.cmp.matrix.png"
  shell: "sourmash plot sulfo.cmp"
