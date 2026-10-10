resource "aws_datapipeline_pipeline_definition" "datapipeline_pipeline_definitions" {
  for_each = var.datapipeline_pipeline_definitions

  pipeline_id = each.value.pipeline_id
  region      = each.value.region

  dynamic "pipeline_object" {
    for_each = each.value.pipeline_object
    content {
      dynamic "field" {
        for_each = pipeline_object.value.field != null ? pipeline_object.value.field : []
        content {
          key          = field.value.key
          ref_value    = field.value.ref_value
          string_value = field.value.string_value
        }
      }
      id   = pipeline_object.value.id
      name = pipeline_object.value.name
    }
  }

  dynamic "parameter_object" {
    for_each = each.value.parameter_object != null ? each.value.parameter_object : []
    content {
      dynamic "attribute" {
        for_each = parameter_object.value.attribute != null ? parameter_object.value.attribute : []
        content {
          key          = attribute.value.key
          string_value = attribute.value.string_value
        }
      }
      id = parameter_object.value.id
    }
  }

  dynamic "parameter_value" {
    for_each = each.value.parameter_value != null ? each.value.parameter_value : []
    content {
      id           = parameter_value.value.id
      string_value = parameter_value.value.string_value
    }
  }
}

