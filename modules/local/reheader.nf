process REHEADER {
    container 'quay.io/biocontainers/samtools:1.19.2--h50ea8bc_0'

    input:
    path bam_file
    val sample_id

    output:
    path 'output.bam', emit: bam_rn_file

    script:
    """
    samtools view -H ${bam_file} > output.bam
    """
}
