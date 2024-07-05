#!/usr/bin/env nextflow

nextflow.enable.dsl=2

include { REHEADER } from './modules/local/reheader.nf'

bam = Channel.fromPath( params.bam ).first()

workflow {
    REHEADER(bam,params.sample_id)
}
