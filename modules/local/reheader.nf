process REHEADER {
    container 'quay.io/biocontainers/samtools:1.19.2--h50ea8bc_0'

    input:
    path bam_file
    val sample_id

    output:
    path 'output.bam', emit: bam_rn_file
    path 'output.bam.bai', emit: bam_rn_index

    script:
    """
    samtools view -H ${bam_file} > header.sam
    awk -v new_sample=${sample_id} '{if (\$1 == "@RG" && match(\$0, /SM:/)) {sub(/SM:[^ \t]+/, "SM:" new_sample)} print}' header.sam > new_header.sam && \
    samtools reheader -@32 new_header.sam ${bam_file} > output.bam
    samtools index output.bam
    """
}
