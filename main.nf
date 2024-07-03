#!/usr/bin/env nextflow

nextflow.enable.dsl=2

include { ADDREPLACERG } from './modules/local/addreplacerg.nf'

bam = Channel.fromPath( params.bam ).first()

workflow {
    ADDREPLACERG(bam,params.sample_id)
}
