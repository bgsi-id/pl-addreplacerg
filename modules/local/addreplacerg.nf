process ADDREPLACERG {
    container 'quay.io/biocontainers/samtools:1.19.2--h50ea8bc_0'

    input:
    path bam_file
    val sample_id

    output:
    path 'output.bam', emit: bam_rn_file
    path 'output.bam.bai', emit: bam_rn_index

    script:
    """
    samtools addreplacerg -r SM:${sample_id} -o output.bam ${bam_file}
    samtools index output.bam
    """
}
