output "datapipeline_pipeline_definitions_id" {
  description = "Map of id values across all datapipeline_pipeline_definitions, keyed the same as var.datapipeline_pipeline_definitions"
  value       = { for k, v in aws_datapipeline_pipeline_definition.datapipeline_pipeline_definitions : k => v.id if v.id != null && length(v.id) > 0 }
}
output "datapipeline_pipeline_definitions_parameter_object" {
  description = "Map of parameter_object values across all datapipeline_pipeline_definitions, keyed the same as var.datapipeline_pipeline_definitions"
  value       = { for k, v in aws_datapipeline_pipeline_definition.datapipeline_pipeline_definitions : k => v.parameter_object if v.parameter_object != null && length(v.parameter_object) > 0 }
}
output "datapipeline_pipeline_definitions_parameter_value" {
  description = "Map of parameter_value values across all datapipeline_pipeline_definitions, keyed the same as var.datapipeline_pipeline_definitions"
  value       = { for k, v in aws_datapipeline_pipeline_definition.datapipeline_pipeline_definitions : k => v.parameter_value if v.parameter_value != null && length(v.parameter_value) > 0 }
}
output "datapipeline_pipeline_definitions_pipeline_id" {
  description = "Map of pipeline_id values across all datapipeline_pipeline_definitions, keyed the same as var.datapipeline_pipeline_definitions"
  value       = { for k, v in aws_datapipeline_pipeline_definition.datapipeline_pipeline_definitions : k => v.pipeline_id if v.pipeline_id != null && length(v.pipeline_id) > 0 }
}
output "datapipeline_pipeline_definitions_pipeline_object" {
  description = "Map of pipeline_object values across all datapipeline_pipeline_definitions, keyed the same as var.datapipeline_pipeline_definitions"
  value       = { for k, v in aws_datapipeline_pipeline_definition.datapipeline_pipeline_definitions : k => v.pipeline_object if v.pipeline_object != null && length(v.pipeline_object) > 0 }
}
output "datapipeline_pipeline_definitions_region" {
  description = "Map of region values across all datapipeline_pipeline_definitions, keyed the same as var.datapipeline_pipeline_definitions"
  value       = { for k, v in aws_datapipeline_pipeline_definition.datapipeline_pipeline_definitions : k => v.region if v.region != null && length(v.region) > 0 }
}

