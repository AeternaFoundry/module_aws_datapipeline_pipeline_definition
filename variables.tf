variable "datapipeline_pipeline_definitions" {
  description = <<EOT
Map of datapipeline_pipeline_definitions, attributes below
Required:
    - pipeline_id
    - pipeline_object (block):
        - field (optional, block):
            - key (required)
            - ref_value (optional)
            - string_value (optional)
        - id (required)
        - name (required)
Optional:
    - region
    - parameter_object (block):
        - attribute (optional, block):
            - key (required)
            - string_value (required)
        - id (required)
    - parameter_value (block):
        - id (required)
        - string_value (required)
EOT

  type = map(object({
    pipeline_id = string
    region      = optional(string)
    pipeline_object = list(object({
      field = optional(list(object({
        key          = string
        ref_value    = optional(string)
        string_value = optional(string)
      })))
      id   = string
      name = string
    }))
    parameter_object = optional(list(object({
      attribute = optional(list(object({
        key          = string
        string_value = string
      })))
      id = string
    })))
    parameter_value = optional(list(object({
      id           = string
      string_value = string
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.datapipeline_pipeline_definitions : (
        length(v.pipeline_object) >= 1
      )
    ])
    error_message = "Each pipeline_object list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.datapipeline_pipeline_definitions : (
        v.parameter_object == null || alltrue([for item in v.parameter_object : (item.attribute == null || alltrue([for item in item.attribute : (length(item.string_value) >= 0 && length(item.string_value) <= 10240)]))])
      )
    ])
    error_message = "must be between 0 and 10240 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.datapipeline_pipeline_definitions : (
        v.parameter_value == null || alltrue([for item in v.parameter_value : (length(item.string_value) >= 0 && length(item.string_value) <= 10240)])
      )
    ])
    error_message = "must be between 0 and 10240 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.datapipeline_pipeline_definitions : (
        length(v.pipeline_id) >= 1 && length(v.pipeline_id) <= 1024
      )
    ])
    error_message = "must be between 1 and 1024 characters"
  }
  # Note: 8 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

